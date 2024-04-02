"""Демонстрация возникновения ситуации, приводящей в положение Deadlock"""

from threading import Thread, Lock, get_ident
from time import sleep, time

start = time()



class Database:
    """Объект, к которому будет осуществляться доступ из разных потоков"""
    def __init__(self, amount, value):
        self.values = [value] * amount  # какие-то данные
        # Мьютекс для возможности ограничения доступа
        self.lock = Lock()

    def add_data(self, value):
        # какие-то действия с объектом
        print("Thread id:", get_ident())
        print("Time:", time() - start)
        self.values.append(value)

    def enter(self):
        # Закрыть доступ в начале работы
        self.lock.acquire()

    def exit(self):
        # Открыть доступ при окончании работы
        self.lock.release()

    def __repr__(self):
        print(f'{self}: ', self.values)


# Объект для работы с Database
class Writer:
    def __init__(self, db):
        self.db = db
        self.db.enter()

    def append(self, value):
        sleep(3)
        self.db.add_data(value)

    def remove(self):
        self.db.exit()
        print("deleted")
        print("Thread id:", get_ident())
        print("Time:", time() - start)


# Основной метод потока
def do_tasks(db1, db2):
    """Создатся 2 объекта Writer, которые блокируют доступ как к db1, так и к db2"""
    wr1 = Writer(db1)
    sleep(1)
    wr1.append(10)
    wr2 = Writer(db2)
    sleep(1)
    wr2.append(15)
    wr2.remove()
    wr1.remove()


def main():
    db1 = Database(5, 5)
    db2 = Database(5, 5)

    one = Thread(target=do_tasks, args=(db1, db2))
    # Если доступ с одинаковой очерёдностью, то не случится Deadlock
    # two = Thread(target=do_tasks, args=(db1, db2))
    two = Thread(target=do_tasks, args=(db2, db1))

    one.start()
    # Если поток one успеет заблокировать доступ к обоим db, то не случится Deadlock
    # sleep(5)
    two.start()

    print("Deadlock")
    """Deadlock, так как поток one заблокировал db1, а поток two - db2
    В результате ни один из них не может освободить доступ, так как сначала они должны поработать с другой db"""

    one.join()
    two.join()

    print(db1)
    print(db2)


if __name__ == "__main__":
    main()

    """Для того, чтобы не произошёл Deadlock, необходимо соблюдать 2 правила:
    Избегать вложенных блокировок ресурсов,
    В случае необходимости вложенных блокировок боеспечить одинаковую очерёдность доступа у всех потоков. 
    """
