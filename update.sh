if [ -z "$1" ]; then
  echo "Error: Debes especificar el nombre del contenedor"
  echo "Uso: ./update-container.sh <nombre-contenedor>"
  exit 1
fi

CONTAINER_NAME=$1

echo "🔵 Actualizando contenedor $CONTAINER_NAME..."

# Paso 1: Detener el contenedor
echo "🛑 Deteniendo el contenedor..."
docker-compose stop $CONTAINER_NAME

# Paso 2: Eliminar el contenedor (forzar eliminación)
echo "🗑️ Eliminando el contenedor..."
docker-compose rm -f $CONTAINER_NAME

# Paso 3: Reconstruir la imagen
echo "🔨 Reconstruyendo la imagen..."
docker-compose build $CONTAINER_NAME

# Paso 4: Iniciar el contenedor
echo "🚀 Iniciando el contenedor actualizado..."
docker-compose up -d $CONTAINER_NAME

echo "✅ Actualización completada para $CONTAINER_NAME"
