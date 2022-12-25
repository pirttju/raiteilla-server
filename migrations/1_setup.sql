CREATE TABLE country (
    id              smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    country_code    text
);

CREATE UNIQUE INDEX country_ux ON country(country_code);

CREATE TABLE source (
    id              smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name            text
);

CREATE TABLE station (
    id              integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    short_code      text,
    source_id       smallint references provider(id),
    name            text
);

CREATE UNIQUE INDEX station_ux ON station(short_code, source_id);

CREATE TABLE operator (
    id              integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    short_code      text,
    source_id       smallint references provider(id),
    name
);

CREATE UNIQUE INDEX operator_ux ON operator(short_code, source_id);

CREATE TABLE train (
    id              integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    departure       date,
    train           integer,
    source_id       smallint references source(id),
    public_train    text,
    operator_id     integer references operator(id),
    cancelled       boolean,
    created         timestamptz,
    regular         boolean
);

CREATE UNIQUE INDEX train_ux ON train(departure, train, source_id);

CREATE TABLE timetable (
    id              integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    train_id        integer references train(id),
    station_id      integer references station(id),
    scheduled       timestamptz,
    is_departure    boolean,
    actual          timestamptz,
    is_estimate     boolean,
    reason_code     text
);

-- Lookup indexes
CREATE INDEX schedule_train_ix ON schedule(train_id);
CREATE INDEX schedule_station_ix ON schedule(station_id);
-- Maintain uniqueness per train
CREATE UNIQUE INDEX schedule_ux ON schedule(scheduled, is_departure, train_id);

CREATE TABLE composition (
    id              integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    timetable_from  integer references timetable(id),
    timetable_to    integer references timetable(id),
    engines         jsonb,
    wagons          jsonb,
    max_speed       smallint,
    train_length    smallint
);
