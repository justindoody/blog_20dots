#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /code/tmp/pids/server.pid

# Helper to set docker secrets storted in files
# as environment variables in container.
file_env() {
   local var="$1"
   local fileVar="${var}_FILE"
   local def="${2:-}"

   if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
      echo >&2 "error: both $var and $fileVar are set (but are exclusive)"
      exit 1
   fi
   local val="$def"
   if [ "${!var:-}" ]; then
      val="${!var}"
   elif [ "${!fileVar:-}" ]; then
      val="$(< "${!fileVar}")"
   fi
   export "$var"="$val"
   unset "$fileVar"
}

file_env "RAILS_MASTER_KEY"
file_env "DATABASE_URL"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"