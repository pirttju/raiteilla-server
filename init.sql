CREATE TABLE stations (
    station_id      integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    short_code      text,
    im_code         smallint,
    name            text
);

CREATE UNIQUE INDEX stations_unique_idx ON (short_code, im_code);

CREATE TABLE trains (
    train_id        integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    departure_date  date,
    train_number    integer,
    im_code         smallint,
);

CREATE UNIQUE INDEX trains_unique_idx ON (departure_date, train_number, im_code);

CREATE TABLE timetablerows (
    train_id        integer,
    station_id      integer,
    is_departure    boolean,
    scheduled_time  timestamptz,
    actual_time     timestamptz,
);
