#!/bin/bash

echo "[helidon] Start wait-for-it.sh"
./wait-for-it.sh mysql:3306 -t 0
echo "[helidon] Finish wait-for-it.sh"

echo "[helidon] Start migrate.bash"
./migrate.bash
echo "[helidon] Finish migrate.bash"

java -jar helidon-mp-tutorial.jar

exec "$@"
