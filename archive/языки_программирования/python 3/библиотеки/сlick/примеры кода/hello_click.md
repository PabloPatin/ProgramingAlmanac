---
tags:
  - python
  - CLI
  - пример_кода
  - click
---
```python 3
import click


@click.command()
def hello():
    click.echo("Hello World!")


if __name__=="__main__":
    hello()
```

Такой код при запуске в терминале будет выводить просто "Hello World!"

```bash
$ python hello.py
Hello World!
```

Однако у такой функции уже будет встроенная страница помощи

```bash
$ python hello.py --help
Usage: hello.py [OPTIONS]

Options:
  --help  Show this message and exit.
```

Рекомендуется использовать имено [[echo|click.echo()]] вместо [[print()]] для того, чтобы неправильная конфигурация терминала не приводила к ошибке.