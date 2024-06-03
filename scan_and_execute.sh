#!/bin/bash

source .env

# Función para listar las carpetas en la carpeta projects
listar_carpetas() {
    echo "Listado de carpetas en projects:"
    find projects/* -maxdepth 0 -type d | awk 'BEGIN{count=1} {print count".", substr($0, 10); count++}'
}

# Función para seleccionar una carpeta
seleccionar_carpeta() {
    read -p "Seleccione el número de la carpeta: " carpeta_numero
    carpeta_seleccionada=$(find projects/* -maxdepth 0 -type d | sed -n "${carpeta_numero}p" | awk '{print substr($0, 10)}')
    if [ ! -d "projects/$carpeta_seleccionada" ]; then
        echo "La carpeta seleccionada no existe."
        exit 1
    fi
}

# Función para seleccionar una versión de PHP
seleccionar_php_version() {
    echo "Seleccione la versión de PHP:"
    select php_version in "php7.3" "php7.4" "php8.2"; do
        if [ -n "$php_version" ]; then
            break
        else
            echo "Opción no válida. Seleccione nuevamente."
        fi
    done
}

# Listar carpetas disponibles
listar_carpetas

# Seleccionar carpeta
seleccionar_carpeta

# Seleccionar versión de PHP
seleccionar_php_version

# Montar el comando para ejecutar
comando="docker exec -it $php_version bash -c 'su - $USER_SO_NAME -c \"cd /var/www/$carpeta_seleccionada && bash\"'"
echo "Ejecutando comando: $comando"

# Ejecutar el comando
eval "$comando"
