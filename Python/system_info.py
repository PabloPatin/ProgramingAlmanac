import platform

# Получаем информацию о системе
system_info = f"OS: {platform.system()}\n"
system_info += f"Release: {platform.release()}\n"
system_info += f"Version: {platform.version()}\n"
system_info += f"Machine: {platform.machine()}\n"
system_info += f"Processor: {platform.processor()}\n"

# Создаем новый текстовый файл и записываем информацию
file_path = "system_info.txt"
with open(file_path, "w") as file:
    file.write(system_info)

print(f"Информация о системе сохранена в файле: {file_path}")
