# Creación de grupos

$file_groups = Import-Csv -Path ".\GruposSistema.csv"
foreach ($group in $file_groups) { 
    New-LocalGroup -Name $group.grupo -Description $group.descripcion
}

# Creación de usuarios

$file_users = Import-Csv -Path ".\UsuariosSistema.csv"
foreach ($user in $file_users) { 
    $clave = ConvertTo-SecureString $user.Password -AsPlainText -Force
    New-LocalUser -Name $user.Login -Password $clave -FullName "$($user.Nombre) $($user.Apellido1) $($user.Apellido2)" -Description $user.Descripcion -PasswordNeverExpires:$false -UserMayNotChangePassword:$false
    Add-LocalGroupMember -Group $user.Departamento -Member $user.Login
    Add-LocalGroupMember -Group "Usuarios" -Member $user.Login
    Write-Host "Usuario $($user.Login) creado y añadido al grupo $($user.Departamento)"
}
