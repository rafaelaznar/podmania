#!/bin/bash

set -e

CERT_DIR="./certs"
CERT_FILE="$CERT_DIR/fullchain.pem"
KEY_FILE="$CERT_DIR/privkey.pem"

echo "🔍 Comprobando certificados TLS..."
if [[ ! -f "$CERT_FILE" || ! -f "$KEY_FILE" ]]; then
  echo "🔐 No se encontraron certificados, generando autofirmado..."
  mkdir -p "$CERT_DIR"
  openssl req -x509 -newkey rsa:2048 -nodes \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -days 365 \
    -subj "/CN=localhost"
  echo "✅ Certificados generados en '$CERT_DIR'."
else
  echo "✅ Certificados existentes encontrados."
fi

echo "🚀 Levantando servicios con podman-compose..."
podman-compose up -d

echo "🌐 Accede a: https://localhost:8443"

