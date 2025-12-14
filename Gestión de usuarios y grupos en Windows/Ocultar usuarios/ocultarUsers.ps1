$file_Users = Import-Csv -Path ".\usuariosOcultar.csv"

# Recorrer usuarios y ocultarlos en la pantalla de inicio
foreach ($user in $file_Users) { 
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /V $user.Login /T REG_DWORD /D 0 /F
    Write-Host "Usuario ocultado: $($user.Login)"
}

Write-Host "Todos los usuarios han sido ocultados."