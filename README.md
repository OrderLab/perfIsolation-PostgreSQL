#PostgreSQL

## Build

```bash
export PSANDBOXDIR=/DIR/TO/PSANDBOX/LIB
export LD_LIBRARY_PATH=/DIR/TO/PSANDBOX/LIB/BUILD
./compile.sh
```

## Running the PostgreSQL
```bash
cd dist
./bin/initdb -D data/
./bin/postgres -D data/ --config-file=data/postgresql.conf 
./bin/createdb test
./bin/psql test
```
