# Лаб 10

## Разраб

Логачев Кирилл Александрович ИУ6-33Б

## Текст задания

Модифицировать код ЛР 8 таким образом, чтобы по запросу с указанными параметрами выдавался результат в формате XML (средствами стандартной сериализации ActiveSupport).

    Проверить формирование XML и сохранить в файл для отладки XSLT и второго приложения.

    Написать функциональный тест, проверяющий формат выдаваемых данных при запросе RSS.

Разработать XSLT-программу преобразования полученной XML в HTML.

Добавить в проверяемый XML-файл строку привязки к преобразованию <?xml-stylesheet type="text/xsl" href="some_transformer.xslt"?>. Проверить корректность отображения браузером результата преобразования.

Проверить на автономной Ruby-программе корректность преобразования, используя следующий фрагмент кода:

require 'nokogiri'
doc = Nokogiri::XML(File.read('some_file.xml'))
xslt = Nokogiri::XSLT(File.read('some_transformer.xslt'))
puts xslt.transform(doc)

Разработать второе приложение, являющееся посредником между клиентом и первым приложением, задачей которого является преобразование XML в HTML или передача в неизменном виде браузеру для отображения браузером. Приложение должно запускаться с указанием номера порта TCP, отличным от номера порта первого приложения (например rails server -p 3001)!

  -  Подготовить каркас приложения, а также форму формирования запроса, форму отображения результата и соответствующие действия контролера.

  - Добавить в контроллер преобразование XML в HTML с помощью ранее разработанного XSLT-файла.

  -  Подключить запрос XML с первого приложения и проверить работу приложений в связке.

  -  Написать функциональный тест, проверяющий что при различных входных данных результат генерируемой страницы различен.

  - Доработать код контроллера и представлений данного приложения для выдачи браузеру XML-потока в неизменном виде (организовать возможность выбора формата выдачи для пользователя).

  - Проверить, что браузер получает XML первого приложения в неизменном виде.

  -  Доработать код контроллера приложения таким образом, чтобы XML-поток первого приложения получал дополнительную строку, указывающую xsl. Модифицировать форму запроса параметров таким образом, чтобы браузер получал в ответ XML. При этом разместить XSLT-файл в директории public.

  -  Проверить, что браузер производит преобразование XML->HTML в соответствии с xlt.

  -  Реализовать функциональные тесты второго приложения. Проверить результаты, формируемые приложением, на соответствие выбранному формату выдачи.

Итоговая форма ввода параметра должна содержать кнопки или селектор, позволяющие проверить два варианта преобразования:

    Серверное xml+xslt->html

    Клиентское xml+xslt->html


---

Дано натуральное число m. Написать программу, определяющую такое натуральное число n, что двоичная запись числа n получается из двоич- ной записи числа m изменением порядка цифр на обратный порядок их следования. Например: 6 = 110 , а 3 = 011. Вывести на печать числа и их двоичное представление.

Скачиваем зависимости (в каждой части):

```bash
bundle install
```

Тесты:

```bash
rspec
```

Линтер:

```bash
rubocop .
```

Запуск сервера:

```bash
rails server
```
