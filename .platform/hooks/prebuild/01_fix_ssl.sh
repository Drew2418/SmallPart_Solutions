#!/bin/bash
set -e  # Stop script on error

echo "---- SSL Fix Script Running ----" >> /var/log/eb-hooks.log

PYTHON_VERSION=$(/opt/python/run/venv/bin/python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
echo "Detected Python version: $PYTHON_VERSION" >> /var/log/eb-hooks.log

/opt/python/run/venv/bin/python -m pip install --upgrade pip certifi >> /var/log/eb-hooks.log 2>&1

CERT_PATH="/opt/python/run/venv/lib/python${PYTHON_VERSION}/site-packages/certifi/cacert.pem"
echo "Setting SSL_CERT_FILE to ${CERT_PATH}" >> /var/log/eb-hooks.log

export SSL_CERT_FILE="${CERT_PATH}"

echo "Verifying certificate file exists..." >> /var/log/eb-hooks.log
ls -l "${CERT_PATH}" >> /var/log/eb-hooks.log

echo "---- SSL Fix Script Completed ----" >> /var/log/eb-hooks.log
