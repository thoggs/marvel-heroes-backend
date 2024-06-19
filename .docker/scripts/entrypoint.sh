#!/bin/sh
# entrypoint.sh

# Set the active profile environment variable, or default if it is not set
SPRING_PROFILES_ACTIVE=${SPRING_PROFILES_ACTIVE:-default}

# Run the application
exec java -Dspring.profiles.active="${SPRING_PROFILES_ACTIVE}" -jar app.jar
