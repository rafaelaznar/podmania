#!/bin/bash

set -e

CERT_DIR="./certs"
KEY_FILE="$CERT_DIR/privkey.pem"
CERT_FILE="$CERT_DIR/fullchain.pem"

# Crear directorio si no existe
mkdir -p "$CERT_DIR"

# Comprobar si ya existen
if [[ -f "$KEY_FILE" && -f "$CERT_FILE" ]]; then
  echo "✅ Certificados ya existen en $CERT_DIR"
  exit 0
fi

# Generar certificados autofirmados
echo "🔐 Generando certificados autofirmados en $CERT_DIR..."
openssl req -x509 -newkey rsa:2048 -nodes \
  -keyout "$KEY_FILE" \
  -out "$CERT_FILE" \
  -days 365 \
  -subj "/CN=localhost"

echo "✅ Certificados generados:"
echo "  - Clave privada: $KEY_FILE"
echo "  - Certificado:   $CERT_FILE"

