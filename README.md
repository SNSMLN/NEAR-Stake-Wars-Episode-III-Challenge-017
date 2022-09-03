# NEAR-Stake-Wars-Episode-III-Challenge-017

Хотя в задании написано, что нужен видео туториал, я все же попробую описать текстом и скриншотами. Вдруг подойдет )

В качестве основы взят туториал https://github.com/Dimokus88/near/blob/main/Guide_RU.md . Внесены незначительные измения в конфиг деплоя и загрузочный скрипт.

Я буду описывать, как запустить резервный сервер , и перейти на него при необходимости. Для установки без существующих ключей никаких ключевых изменений, только вместо импорта ключа валидатора создаем новый, и регистрируем пул. 

Итак, установка резервного сервера near в akash

Разбиваем установку на основные этапы:
1- установка неофициального клиента для akash - Akashlytics
2- создание аккаунта 
3- создание сертификата
4- развертывание сервера
5- установка ноды near на сервере
6- ожидание полной синхронизации
7- импорт ключей основной ноды, перезапуск
8- контроль онлайн и подписи чанков


**1 установка неофициального клиента для akash - Akashlytics**

Клиент Akashlytics находится по ссылке https://akashlytics.com/deploy
Выбираем свою ОС, скачиваем, запускаем. Затруднений тут быть не должно.


**2 создание аккаунта akash**

Соглашаемся с уведомлением, что это beta версия
![near ch17 7 add account 11](https://user-images.githubusercontent.com/76874974/188269853-c8546ee9-af6a-4f8d-a66b-afe72f94af46.png)

Нажимаем Create new account
![near ch17 7 add account 12](https://user-images.githubusercontent.com/76874974/188269873-88dad738-e660-45ff-9eda-17c696b90a00.png)

Создаем новый аккаунт . Имя пароль произвольные
![near ch17 7 add account 13](https://user-images.githubusercontent.com/76874974/188269877-eccbb1f4-2eff-4f01-8d74-19349b4067eb.png)

Сохраняем в безопасном месте сид фразу. Может понадобится для восстановления контроля над аккаунтом
![near ch17 7 add account 14](https://user-images.githubusercontent.com/76874974/188269888-a2be985a-60a3-4279-91ad-ae020c32e7dd.png)
![near ch17 7 add account 15](https://user-images.githubusercontent.com/76874974/188269896-bf2e4971-521c-4fc1-b1e5-51fb31c1c170.png)

Подтверждаем, что сохранили сид фразу, вводом всех слов в той же последовательности, как и в предыдущем окне
![near ch17 7 add account 16](https://user-images.githubusercontent.com/76874974/188269910-4f64bcb6-fe5d-4fc0-825b-2889d458f398.png)

Сохраняем адрес кошелька. 

![near ch17 7 add account 17](https://user-images.githubusercontent.com/76874974/188269923-6e769f5e-74a9-41ec-80a4-f55ca0b98443.png)

Важно!
Пополняем баланс кошелька минимум на 6 ACT. Без этого дальшейшие шаги не выполнить.


**3- создание сертификата**
В правом углу кнопка, нажимаем ее, создаем сертификат, 


![near ch17 8 create cert 1](https://user-images.githubusercontent.com/76874974/188270076-394c0e14-a8c7-4f0e-a6e0-0d633f5410c2.png)

![near ch17 8 create cert 2](https://user-images.githubusercontent.com/76874974/188270080-532521d4-dec7-4151-a627-0e42d3908584.png)


![near ch17 8 create cert 3](https://user-images.githubusercontent.com/76874974/188270094-af1f3f16-53eb-47a0-b4b8-4918d70e7555.png)

подписываем транзакацию

![near ch17 8 create cert 4](https://user-images.githubusercontent.com/76874974/188270105-0d89c6f3-f7fe-4a22-be00-9b64a6109506.png)

![near ch17 8 create cert 5](https://user-images.githubusercontent.com/76874974/188270106-e1661f32-b158-4e7e-bb42-6091d4adba97.png)

Сохраняем ключ сертификата . Может пригодится для восстановления 

![near ch17 8 create cert 6](https://user-images.githubusercontent.com/76874974/188270107-47608004-0d60-44fe-9b3a-ee5e7af09c4d.png)

![near ch17 8 create cert 7](https://user-images.githubusercontent.com/76874974/188270109-2001052a-9d4a-4380-a9dd-4b0b8fac0112.png)






