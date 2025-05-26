#!/bin/bash

set -e

# 1. Comprovar podman-compose
if ! command -v podman-compose &> /dev/null; then
  echo "❌ Error: podman-compose no està instal·lat."
  exit 1
fi

# 2. Comprovar que el JAR existeix
JAR_PATH="./springboot-app/myapp.jar"
if [ ! -f "$JAR_PATH" ]; then
  echo "❌ Error: no es troba $JAR_PATH"
  echo "Assegura't de compilar l'aplicació Spring Boot i col·locar el .jar en eixe directori."
  exit 1
fi

# 3. Crear certificats auto-signats si no existeixen
CERT_DIR="./certs"
CERT="$CERT_DIR/fullchain.pem"
KEY="$CERT_DIR/privkey.pem"

if [ ! -f "$CERT" ] || [ ! -f "$KEY" ]; then
  echo "🔐 Generant certificats auto-signats..."
  mkdir -p "$CERT_DIR"
  openssl req -x509 -newkey rsa:4096 -keyout "$KEY" -out "$CERT" -days 365 -nodes -subj "/CN=localhost"
  echo "✅ Certificats creats a $CERT_DIR"
fi

# 4. Iniciar serveis
echo "🚀 Alçant serveis amb podman-compose..."
podman-compose up
