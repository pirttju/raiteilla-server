# raiteilla-server

Backend implementation for raiteilla.fi

## Dependencies

Rust.

## Installing

Git clone.

Create an empty PostgreSQL database and then initialise tables using the supplied init.sql script.

## Starting

Set environment and run the server from main directory:

```
DATABASE_URL='postgresql://user:password@host:port/database' cargo run
```
