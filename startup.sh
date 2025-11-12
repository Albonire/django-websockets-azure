#!/bin/bash
source antenv/bin/activate

echo "🚀 Iniciando aplicación Django con WebSockets en Azure..."

# Colectar archivos estáticos
echo "📦 Recolectando archivos estáticos..."
python manage.py collectstatic --noinput

# Ejecutar migraciones
echo "🔄 Ejecutando migraciones de base de datos..."
python manage.py migrate --noinput

# Crear superusuario si no existe (opcional - comentar si no lo necesitas)
# echo "👤 Verificando superusuario..."
# python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'cambiar_password')"

echo "✅ Configuración completada"
echo "🌐 Iniciando servidor Daphne..."

# Iniciar Daphne en el puerto 8000
daphne -b 0.0.0.0 -p 8000 proyecto.asgi:application
