#!/bin/bash
EXIT_STATUS=0

case "$GORM_IMPL"  in
    hibernate)
        ./gradlew grails-datastore-gorm-hibernate:test || EXIT_STATUS=$?
        ;;
    hibernate4)
        ./gradlew grails-datastore-gorm-hibernate4:test || EXIT_STATUS=$?
        ;;
    mongodb)
        ./gradlew grails-datastore-gorm-mongodb:test || EXIT_STATUS=$?
        ;;
    redis)
        ./gradlew grails-datastore-gorm-redis:test || EXIT_STATUS=$?
        ;;
    restclient)
        ./gradlew grails-datastore-gorm-rest-client:test || EXIT_STATUS=$?
        ;;
    *)
        ./gradlew testClasses || EXIT_STATUS=$?
        ./gradlew grails-datastore-gorm-test:test || EXIT_STATUS=$?
        ;;
esac

exit $EXIT_STATUS



