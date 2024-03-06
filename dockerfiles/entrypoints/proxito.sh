#! /bin/sh

../../docker/common.sh

CMD="gunicorn readthedocs.wsgi:application -w 3 -b 0.0.0.0:8000 --log-level=CRITICAL --max-requests=10000 --timeout=0"

if [ -n "${DOCKER_NO_RELOAD}" ]; then
  echo "Running process with no reload"
  $CMD
else
  echo "Running process with reload"
  nodemon --config ../nodemon.json --exec "${CMD}"
fi
