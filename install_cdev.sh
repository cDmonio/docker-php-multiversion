#!/bin/bash

# Ruta del archivo original
original_file="./.scripts/cdev"

# Cambia los permisos del archivo
chmod +x "$original_file"

# Copia el archivo a /usr/local/bin/
sudo cp "$original_file" /usr/local/bin/

# Confirma que el archivo se ha copiado
echo "El archivo cdev ha sido copiado a /usr/local/bin/ y sus permisos han sido cambiados."
