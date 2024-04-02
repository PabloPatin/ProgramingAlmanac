import platform

# Получаем информацию о системе
system_info = f"OS: {platform.system()}\n"
system_info += f"Release: {platform.release()}\n"
system_info += f"Version: {platform.version()}\n"
system_info += f"Machine: {platform.machine()}\n"
system_info += f"Processor: {platform.processor()}\n"

print(system_info)
