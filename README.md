# NEAR-Stake-Wars-Episode-III-Challenge-017

Хотя в задании написано, что нужен видео туториал, я все же попробую описать текстом и скриншотами. Вдруг подойдет )

В качестве основы взят туториал https://github.com/Dimokus88/near/blob/main/Guide_RU.md . Внесены измения в конфиг и загрузочный скрипт.

Я буду описывать, как запустить резервный сервер , и перейти на него при необходимости. Для установки без существующих ключей никаких значительных изменений, только вместо импорта ключа валидатора создаем новый, и регистрируем пул. 

Итак, установка резервного сервера near в akash

Разбиваем на основные этапы
1- установка неофициального клиента для akash - Akashlytics
2- создание аккаунта 
3- создание сертификата
4- развертывание сервера
5- установка ноды near на сервере
6- ожидание полной синхронизации
7- импорт ключей основной ноды, перезапуск
8- контроль онлайн и подписи чанков


1
Клиент Akashlytics находится по ссылке https://akashlytics.com/deploy
Выбираем свою ОС, скачиваем, запускаем. Затруднений тут быть не должно.

2
Создаем новый аккаунт 

![near ch17 7 add account 11](https://user-images.githubusercontent.com/76874974/188269853-c8546ee9-af6a-4f8d-a66b-afe72f94af46.png)
![near ch17 7 add account 12](https://user-images.githubusercontent.com/76874974/188269873-88dad738-e660-45ff-9eda-17c696b90a00.png)
![near ch17 7 add account 13](https://user-images.githubusercontent.com/76874974/188269877-eccbb1f4-2eff-4f01-8d74-19349b4067eb.png)
![near ch17 7 add account 14](https://user-images.githubusercontent.com/76874974/188269888-a2be985a-60a3-4279-91ad-ae020c32e7dd.png)
![near ch17 7 add account 15](https://user-images.githubusercontent.com/76874974/188269896-bf2e4971-521c-4fc1-b1e5-51fb31c1c170.png)
![near ch17 7 add account 16](https://user-images.githubusercontent.com/76874974/188269910-4f64bcb6-fe5d-4fc0-825b-2889d458f398.png)
![near ch17 7 add account 17](https://user-images.githubusercontent.com/76874974/188269923-6e769f5e-74a9-41ec-80a4-f55ca0b98443.png)






