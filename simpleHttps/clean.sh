#!/bin/bash

echo "🛑 Deteniendo todos los contenedores..."
podman stop $(podman ps -aq) 2>/dev/null || echo "No hay contenedores en ejecución."

echo "🗑️ Eliminando todos los contenedores..."
podman rm -f $(podman ps -aq) 2>/dev/null || echo "No hay contenedores para eliminar."

echo "🔌 Eliminando redes no utilizadas..."
podman network prune -f

echo "🧼 Limpiando sistema (imágenes no usadas, volúmenes colgantes)..."
podman system prune -a -f

echo "✅ Entorno completamente limpio."

