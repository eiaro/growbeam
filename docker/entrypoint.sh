#!/bin/bash
# Activate Python virtual environment if it exists
if [ -d /venv ]; then
  source /venv/bin/activate
fi

# Pass all arguments to the shell
exec "$@"
