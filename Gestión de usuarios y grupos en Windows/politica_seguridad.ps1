# Contraseña válida para máximo 20 días
net accounts /maxpwage:20

# Mínimo 1 día antes de poder cambiarla 
net accounts /minpwage:1

# Longitud mínima : 10 caracteres
net accounts /minpwlen:10

# Bloquea la cuenta tras 6 intentos fallidos
net accounts /lockoutthreshold:6

# Duración del bloqueo: 60 minutos 
net accounts /lockoutduration:60

# Ventana de bloqueo: 60 minutos
net accounts /lockoutwindow:60
