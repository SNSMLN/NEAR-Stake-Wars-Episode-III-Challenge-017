# NEAR-Stake-Wars-Episode-III-Challenge-017

Хотя в задании написано, что:

1- задание для testnet, а я делал в shardnet. 

2 - нужен видео туториал. 

Я все же попробую описать текстом и скриншотами. Вдруг подойдет )

***Дизмейкер - в общем то у меня все получилось. Не хватило токенов AKT, чтобы набрать нормальный аптайм. Но нода заработала, и успешно подписывала чанки.***


В качестве основы взят туториал https://github.com/Dimokus88/near/blob/main/Guide_RU.md . Внесены незначительные измения в конфиг деплоя и загрузочный скрипт.

Я буду описывать, как запустить резервный сервер , и перейти на него при необходимости. Для установки без существующих ключей никаких ключевых изменений, только вместо импорта ключа валидатора создаем новый, и регистрируем пул. 

Итак, установка резервного сервера near в akash

Разбиваем установку на основные этапы:

1 установка неофициального клиента для akash - Akashlytics

2 создание аккаунта 

3 создание сертификата

4 развертывание сервера

5 установка ноды near на сервер

6 ожидание полной синхронизации

7 импорт ключей основной ноды, перезапуск

8 контроль онлайн и подписи чанков


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

Сохраняем в безопасном месте сид фразу. Может понадобится для восстановления контроля над аккаунтом. Нажимаем next
![near ch17 7 add account 14](https://user-images.githubusercontent.com/76874974/188269888-a2be985a-60a3-4279-91ad-ae020c32e7dd.png)
![near ch17 7 add account 15](https://user-images.githubusercontent.com/76874974/188269896-bf2e4971-521c-4fc1-b1e5-51fb31c1c170.png)

Подтверждаем, что сохранили сид фразу, вводом всех слов в той же последовательности, как и в предыдущем окне. Нажимаем next
![near ch17 7 add account 16](https://user-images.githubusercontent.com/76874974/188269910-4f64bcb6-fe5d-4fc0-825b-2889d458f398.png)

Сохраняем адрес кошелька. 
![near ch17 7 add account 17](https://user-images.githubusercontent.com/76874974/188269923-6e769f5e-74a9-41ec-80a4-f55ca0b98443.png)

**Важно!** 
Пополняем баланс кошелька минимум на 6 ACT. Потому что деплой (развертывание) нового сервера требует депозит минимум 5ACT, плюс комиссии за транзакции. 
Без этого дальшейшие шаги не выполнить.


**3 создание сертификата**

В правом углу кнопка create sectificate, нажимаем ее, создаем сертификат, 
![near ch17 8 create cert 1](https://user-images.githubusercontent.com/76874974/188270076-394c0e14-a8c7-4f0e-a6e0-0d633f5410c2.png)

Вводим пароль от кошелька
![near ch17 8 create cert 2](https://user-images.githubusercontent.com/76874974/188270080-532521d4-dec7-4151-a627-0e42d3908584.png)

Ставим минимальную комиссию, подписываем транзакацию - нажимаем approve
![near ch17 8 create cert 3](https://user-images.githubusercontent.com/76874974/188270094-af1f3f16-53eb-47a0-b4b8-4918d70e7555.png)

![near ch17 8 create cert 4](https://user-images.githubusercontent.com/76874974/188270105-0d89c6f3-f7fe-4a22-be00-9b64a6109506.png)

Сохраняем ключ сертификата . Может пригодится в дальнейшем для восстановления.
![near ch17 8 create cert 5](https://user-images.githubusercontent.com/76874974/188270106-e1661f32-b158-4e7e-bb42-6091d4adba97.png)

![near ch17 8 create cert 6](https://user-images.githubusercontent.com/76874974/188270107-47608004-0d60-44fe-9b3a-ee5e7af09c4d.png)

![near ch17 8 create cert 7](https://user-images.githubusercontent.com/76874974/188270109-2001052a-9d4a-4380-a9dd-4b0b8fac0112.png)


**4 развертывание сервера**

Используем шаблон деплоя . Не забываем указать свой пароль root.

`https://github.com/SNSMLN/NEAR-Stake-Wars-Episode-III-Challenge-017/blob/main/near-snsmln.deploy `
      

В шаблоне деплоя используется следующий скрипт развертывания приложения:
`https://raw.githubusercontent.com/SNSMLN/NEAR-Stake-Wars-Episode-III-Challenge-017/main/start.sh`

Итак, начали.
Нажимаем справа вверху create deployment


Выбираем empty пустой шаблон для развертывания  , next

Выбираем имя для деплоя, и  вставляем свой шаблон для развертывания  , next
 
Для создания деплоя нужно сделать депозит , минимум 5 AKT . Вводим размер депозита, next

Выбираем минимальную комиссию low, подписываем транзакцию approve

Теперь выбираем из списка доступных провайдеров тот, который нам подходит по цене, расположению, скорости интернета. Время выбора ограничено - 5 минут. Нажимаем accept bud

Все, деплой создан. 

Можно посмотреть логи создания деплоя, статус деплоя, зайти в консоль прямо из приложения

![near ch17 9 create deployment 1](https://user-images.githubusercontent.com/76874974/188696074-8c69b0de-f235-4c53-bab9-dcc942873c0d.png)
![near ch17 9 create deployment 2](https://user-images.githubusercontent.com/76874974/188696097-fc4ac83a-84a0-49b4-8854-01130eb73698.png)
![near ch17 9 create deployment 3](https://user-images.githubusercontent.com/76874974/188696103-d6f2a006-1e08-4b20-b548-6c0094b09ac7.png)
![near ch17 9 create deployment 4](https://user-images.githubusercontent.com/76874974/188696108-d0ccc8dc-a015-45ad-b8ce-ca3f2d580ea0.png)
![near ch17 9 create deployment 5](https://user-images.githubusercontent.com/76874974/188696113-21ccd304-74a8-4591-927e-3285eef47114.png)
![near ch17 9 create deployment 6](https://user-images.githubusercontent.com/76874974/188696117-0d36e456-7784-4aa2-8dae-de06176a2462.png)
![near ch17 9 create deployment 7](https://user-images.githubusercontent.com/76874974/188696119-e536637f-3bb2-4dcb-bf6d-48b25c960103.png)
![near ch17 9 create deployment 8](https://user-images.githubusercontent.com/76874974/188696126-c1f8e561-b796-4506-ba74-578a033b8cb9.png)
![near ch17 9 create deployment 9](https://user-images.githubusercontent.com/76874974/188696132-0487344b-0ef3-4d69-b0ed-f0189b98c3bf.png)
![near ch17 9 create deployment 10](https://user-images.githubusercontent.com/76874974/188696142-35eb8229-64f8-44de-96fb-007560e13372.png)
![near ch17 9 create deployment 11](https://user-images.githubusercontent.com/76874974/188696147-5796298b-174c-4e73-87f4-86448bb26b98.png)
![near ch17 9 create deployment 12](https://user-images.githubusercontent.com/76874974/188696154-7d0fdc78-736b-4e05-bd5c-d8a5be08c953.png)
![near ch17 9 create deployment 13](https://user-images.githubusercontent.com/76874974/188696159-50ad0cb6-67e1-4831-834e-b770ab44167a.png)
![near ch17 9 create deployment 14](https://user-images.githubusercontent.com/76874974/188696168-36a8c2c5-6b0b-401d-ab1c-c3fc2bafa6d9.png)

      
![near ch17 10 choose provider](https://user-images.githubusercontent.com/76874974/188701192-9efd1b89-b7ff-47c4-a66a-39803d3c5541.png)
![near ch17 10 choose provider detail](https://user-images.githubusercontent.com/76874974/188701197-a8ae59e7-6ea3-4869-b6ee-42d81820d303.png)
![near ch17 10 choose provider detail ext 1](https://user-images.githubusercontent.com/76874974/188701206-6d3693ac-e3e4-4b17-9558-3ddcff9649cc.png)
![near ch17 10 choose provider detail ext 2](https://user-images.githubusercontent.com/76874974/188701207-5ac54835-660c-4bfe-88d8-50377c6ac69a.png)

      


