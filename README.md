# NEAR-Stake-Wars-Episode-III-Challenge-017
Although the task says that: 1 is a task for testnet, and I did in shardnet. 2 - need video tutorial. I'll try to describe it in text in my native language and put screenshots. Suddenly it will come))) . In general, I succeeded. There were not enough AKT tokens to gain a normal uptime. I only got 25%. But the neard is worked, and successfully signed the chunks.

Хотя в задании написано, что:

1- задание для testnet, а я делал в shardnet. 

2 - нужен видео туториал. 

Я все же попробую описать текстом и скриншотами. Вдруг подойдет )

***Дизмейкер - в общем то у меня все получилось. Не хватило токенов AKT, чтобы набрать нормальный аптайм. У меня вышло только 25%. Но нода заработала, и успешно подписывала чанки.***
![near ch17 17 val-primary key status 9](https://user-images.githubusercontent.com/76874974/188724658-dcefb46b-87d2-4adb-95f2-f42dc32a0cfe.png)


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



      
![near ch17 10 choose provider](https://user-images.githubusercontent.com/76874974/188701192-9efd1b89-b7ff-47c4-a66a-39803d3c5541.png)
![near ch17 10 choose provider detail](https://user-images.githubusercontent.com/76874974/188701197-a8ae59e7-6ea3-4869-b6ee-42d81820d303.png)
![near ch17 10 choose provider detail ext 1](https://user-images.githubusercontent.com/76874974/188701206-6d3693ac-e3e4-4b17-9558-3ddcff9649cc.png)
![near ch17 10 choose provider detail ext 2](https://user-images.githubusercontent.com/76874974/188701207-5ac54835-660c-4bfe-88d8-50377c6ac69a.png)



**5 установка ноды near на сервер**

С вкладки информации о деплое берем uri сервера, и порт, на котором извне находится ssh  У меня это uri
sed6hu0h2te3j3bg73ccn5uces.ingress.europlots.com
30633:22 .У вас будут другие

![near ch17 9 create deployment 14](https://user-images.githubusercontent.com/76874974/188696168-36a8c2c5-6b0b-401d-ab1c-c3fc2bafa6d9.png)

Подключаемся к серверу своим ssh клиентом. У меня Remmina.

![near ch17 9 create deployment 13](https://user-images.githubusercontent.com/76874974/188696159-50ad0cb6-67e1-4831-834e-b770ab44167a.png)


Далее используем скрипты установки по порядку. Не забываем указать свой пул в set-vars.sh

`000-challenge-1
020--apt--update.sh
030-install-node-js.sh
035-cmd-update-npm.sh
040-install-near-cli.sh
045-cmd-update-npm-fix.sh
050-set-vars.sh
060-ufw-open-ports.sh
100-challenge-2
110-check-cpu-support.sh
120-install-depends.sh
130-install-python-pip.sh
140-install-rust.sh
150-get-from-git.sh
160-make.sh
170-copy-bin.sh
180-init.sh
182-get-config.sh
186-test-run-node.sh
192-create-validator-reserved-json.sh
194-chande-priv-key-to-secret-key.sh
195-backup-keys.sh
196-make-service-file.sh
197-en-start-service.sh`

                                                                                                                  


Все, нода установлена . Смотрим логи see-logs.sh


**6 ожидание полной синхронизации**
После запуска ноды просто ждем, пока нода не синх полностью с сетью. Ожидание от 3 часов до суток. Зависит от интернета, диска, количества и качества пиров....

![near ch17 12 rpc 1](https://user-images.githubusercontent.com/76874974/188722166-75688bcb-15e0-46af-b74f-121784e24078.png)
![near ch17 12 rpc 2](https://user-images.githubusercontent.com/76874974/188722174-0eb59d14-23c3-4cb3-86a0-890d3e2ea52b.png)
![near ch17 12 rpc 3](https://user-images.githubusercontent.com/76874974/188722178-e8bef0f3-344e-459e-a457-627e25eefafa.png)
![near ch17 12 rpc 4](https://user-images.githubusercontent.com/76874974/188722181-cf8bc373-4dcd-47c4-8ae5-1a9d65834ac9.png)


В логах должно появиться сообщение вида 

100 validators , 15 peers

![near ch17 13 full sync 1](https://user-images.githubusercontent.com/76874974/188722310-deeef8a4-8448-4cf6-ad5d-567f8c324397.png)
![near ch17 13 full sync 2](https://user-images.githubusercontent.com/76874974/188722321-5c5c990e-0f2c-440a-a516-f3b82676e6b4.png)
![near ch17 13 full sync 3](https://user-images.githubusercontent.com/76874974/188722324-cac2693d-d086-4417-aef9-dd4b10dd4dd1.png)
![near ch17 13 full sync 4](https://user-images.githubusercontent.com/76874974/188722329-2cca862e-4b4b-4859-9eba-b3d08a5a1f78.png)
![near ch17 13 full sync 5](https://user-images.githubusercontent.com/76874974/188722333-9cf01533-6b36-4a57-892f-f71bd96aeb50.png)



Только когда дождемся  этого (полной синхронизации) , можно переходить к следующему этапу




**7 импорт ключей основной ноды, перезапуск**

Действуем, как в челлендже про резервную ноду. Останавливаем основную ноду. Останавливаем резервную (akash) . Копируем validator.json от основной ноды в папку data резервной. Запускаем резервную (akash) . 

!!! Важно!!! - нельзя чтобы в сети были две ноды с одним ключом. Заслэшат ноду, и будет сложно потом выбираться из тюрьмы.


![near ch17 14 val-primary key 0](https://user-images.githubusercontent.com/76874974/188722955-e3874b06-628e-45fb-85fb-3e6ca6a0bb88.png)
![near ch17 14 val-primary key 1](https://user-images.githubusercontent.com/76874974/188722962-690d9332-82da-456c-8ea9-9730284015ef.png)
![near ch17 14 val-primary key 2](https://user-images.githubusercontent.com/76874974/188722966-f1d9eaeb-4f00-4d70-842a-3542571209e9.png)
![near ch17 14 val-primary key 3](https://user-images.githubusercontent.com/76874974/188722970-870732f1-6996-4693-a9b7-adf87001139b.png)
![near ch17 14 val-primary key 4](https://user-images.githubusercontent.com/76874974/188722972-1096e840-a1a0-4bbe-b932-8c5a4d2bd2fd.png)
![near ch17 14 val-primary key 5](https://user-images.githubusercontent.com/76874974/188722978-16c06c8f-0810-44f0-8030-6cb0600dca72.png)
![near ch17 14 val-primary key 6](https://user-images.githubusercontent.com/76874974/188722982-54d36341-f8dd-495e-8f40-f6738dbf47bf.png)



** 8 контроль онлайн и подписи чанков **

В общем то все. 

Остается только контроллировать работу ноды. У меня не хватило времени , чтобы набрать нормальный онлайн. Так как после каждого перезапуска все пиры обнуляются. И половину эпохи нода не подписывает блоки.. У меня просто не хватило токенов AKT на онлайн ноды.  Но набрал 22%, что уже достойный результат. Думаю, в следующую эпоху вытянула бы больше 60% точно. Работала нода устойчиво, без глюков и непонятных перезагрузок сервиса.

![near ch17 16 val-primary key status 1](https://user-images.githubusercontent.com/76874974/188724320-60ed3602-14bc-4b21-b6ca-d6d9bfd3d8f3.png)
![near ch17 16 val-primary key status 2](https://user-images.githubusercontent.com/76874974/188724325-4167239d-669d-42e9-9ceb-2669cc3a0e7d.png)
![near ch17 16 val-primary key status 3](https://user-images.githubusercontent.com/76874974/188724327-3e7b1f78-52cc-41cd-961e-af1ad197600a.png)
![near ch17 16 val-primary key status 4](https://user-images.githubusercontent.com/76874974/188724330-70597d82-1c03-4669-a824-73a786018ca9.png)
![near ch17 16 val-primary key status 5](https://user-images.githubusercontent.com/76874974/188724335-6058bbe6-8ecd-4f3b-9ec8-fe57728d5f8b.png)
![near ch17 16 val-primary key status 6](https://user-images.githubusercontent.com/76874974/188724341-ca6d7287-c0d8-40ca-9295-27f273a3dabf.png)
![near ch17 16 val-primary key status 7](https://user-images.githubusercontent.com/76874974/188724345-ba421d8f-bb1c-4180-879a-de10f6563eac.png)
![near ch17 16 val-primary key status 8](https://user-images.githubusercontent.com/76874974/188724349-9e47f1a6-3092-4035-b902-3e5b5a25c6cb.png)






И  завершительный скрин. Непосредственно конец эпохи. Перед остановкой ноды на akash

![near ch17 17 val-primary key status 3](https://user-images.githubusercontent.com/76874974/188724632-dcfcfb99-5d48-4c81-a6b3-b8a1635a42ae.png)
![near ch17 17 val-primary key status 4](https://user-images.githubusercontent.com/76874974/188724636-fde90930-6d87-4036-8ef1-cc446c7106e0.png)
![near ch17 17 val-primary key status 5](https://user-images.githubusercontent.com/76874974/188724639-0a099e4a-abf7-4a25-8044-0cc18feb556f.png)
![near ch17 17 val-primary key status 6](https://user-images.githubusercontent.com/76874974/188724645-9055cefd-53ff-4ed2-a16b-4b5059871f27.png)
![near ch17 17 val-primary key status 7](https://user-images.githubusercontent.com/76874974/188724649-8cc213dd-020f-47e0-be67-35830b1b9402.png)
![near ch17 17 val-primary key status 8](https://user-images.githubusercontent.com/76874974/188724654-67979a72-5ae9-4a10-953a-6583ef4ffef8.png)
![near ch17 17 val-primary key status 9](https://user-images.githubusercontent.com/76874974/188724658-dcefb46b-87d2-4adb-95f2-f42dc32a0cfe.png)




