# Параметры

## name ([[string|str]] | [[NoneType|None]])
Имя команды, отображаемое в справке.

## context_settings ([[dictionary|dict]]\[[[string|str]], [[Any]]\])
Необязательный словарь со значениями по умолчанию, которые передается объекту контекста.

## callback ([[Callable]] | [[NoneType|None]])
Функция для вызова при выполнении команды

## params ([[list]]\[[[Parameter]]\] | [[None]])
Параметры, связанные с командой

## help ([[string|str]] | [[NoneType|None]])
Строка помощи для команды

## epilog ([[string|str]] | [[NoneType|None]])
Текст, который будет выведен в конце страницы помощи

## short_help ([[string|str]] | [[NoneType|None]])
Сокращённая версия текста справки

## add_help_option ([[boolean|bool]])
Включает и отключает опцию --help

## no_args_is_help ([[boolean|bool]])
Отключает список аргументов на странице помощи 

## hidden ([[boolean|bool]])
Скрывает команду со страницы помощи

## deprecated ([[boolean|bool]])
Пометить команду как [[deprecated]]

## options_metavar ([[string|str]] | [[NoneType|None]])
Отображение слова \[OPTIONS\] на странице помощи
