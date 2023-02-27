## ASKme
Простой аналог популярного сервиса [ask.fm](https://ask.fm/), где пользователи могут задавать друг другу вопросы и отвечать на них

Рабочее приложение ```ASKme``` находится по адресу: https://askme.goodprogramming.ru/

Из особенностей:
* аватары пользователей загружаются с помощью ```Gravatar```([сайт](https://ru.gravatar.com/))
* антиспам с помощью ```Google reCaptcha v2```
* простая аутентификация пользователей без возможности восстановления пароля

Версия Ruby и Rails:
```
ruby >= 3.0.0
rails ~> 7.0.4
```
### Запуск и использование
Установите ```Bundler```:
```
gem install bundler
```
Сделайте клон репозитория:
```
git clone https://github.com/lordsynergy/askme_new.git
```
Находясь в папке проекта установите зависимости:
```
bundle install
```
Выполните миграции:
```
bundle exec rails db:migrate
```
Для корректной работы антиспама, необходимо зарегистрироваться в google-сервисе ```https://developers.google.com/recaptcha/docs/settings``` и получить ключи, которые необходимо
добавить в файл ```.env```:
```
RECAPTCHA_PUBLIC_KEY
RECAPTCHA_PRIVATE_KEY
```
Запустите сервер приложения:
```
bundle exec rails s
```
В любом браузере введите адрес и откройте:
```
http://localhost:3000
```