# Укажите путь к вашему курсору
$customCursor = "C:\Path\To\Your\Custom\Cursor.cur"

# Укажите путь к папке, для которой вы хотите установить курсор
$targetFolder = "C:\Path\To\Your\Target\Folder"

# Функция для установки курсора
function Set-CustomCursor {
    reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "$customCursor" /f | Out-Null
}

# Функция для возврата к стандартному курсору
function Reset-StandardCursor {
    reg add "HKCU\Control Panel\Cursors" /v Arrow /t REG_EXPAND_SZ /d "C:\Windows\Cursors\arrow_normal.cur" /f | Out-Null
}

# Проверяем, находимся ли мы в целевой папке и устанавливаем курсор
if (Test-Path $targetFolder) {
    Set-Location $targetFolder
    Set-CustomCursor
} else {
    Write-Host "Вы не находитесь в целевой папке."
    Reset-StandardCursor
}

# Создаем объект FileSystemWatcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $targetFolder
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

# Создаем обработчик события для события Changed
$action = {
    # Проверяем, находимся ли мы в целевой папке и устанавливаем курсор
    if ((Get-Location).Path -eq $targetFolder) {
        Set-CustomCursor
    } else {
        Reset-StandardCursor
    }
}

# Регистрируем обработчик события для события Changed
Register-ObjectEvent -InputObject $watcher -EventName Changed -Action $action

# Ожидаем завершения скрипта
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} finally {
    # Удаляем обработчик события
    Unregister-Event -SourceIdentifier FileSystemWatcher -ErrorAction SilentlyContinue
    # Возвращаемся к стандартному курсору
    Reset-StandardCursor
}
