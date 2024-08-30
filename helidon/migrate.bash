mvn clean flyway:migrate \
    -Dflyway.user=$(grep 'flyway.user' config/flyway-secrets.properties | cut -d'=' -f2) \
    -Dflyway.password=$(grep 'flyway.password' config/flyway-secrets.properties | cut -d'=' -f2)
