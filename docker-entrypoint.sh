#!/bin/bash
set -e
if [ "$1" = "webmin" ]; then
exec /usr/bin/supervisord -n
fi
exec "$@"
