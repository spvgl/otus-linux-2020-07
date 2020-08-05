# HW01 -- обновление ядра

```
Цель: Студент получит навыки работы с Git, Vagrant, Packer и публикацией готовых образов в Vagrant Cloud.

В материалах к занятию есть методичка, в которой описана процедура обновления ядра из репозитория. По данной методичке требуется выполнить необходимые действия. Полученный в ходе выполнения ДЗ Vagrantfile должен быть залит в ваш репозиторий. Для проверки ДЗ необходимо прислать ссылку на него.

Для выполнения ДЗ со * и ** вам потребуется сборка ядра и модулей из исходников.

Критерии оценки: Основное ДЗ - в репозитории есть рабочий Vagrantfile с вашим образом.

ДЗ со звездочкой: Ядро собрано из исходников

ДЗ с **: В вашем образе нормально работают VirtualBox Shared Folders
```

Методичка -- https://github.com/dmitry-lyutenko/manual_kernel_update/blob/master/manual/manual.md

```
cd hw01-kernel\packer
packer build centos.json
vagrant box add --name centos-7-5 centos-7.7.1908-kernel-5-x86_64-Minimal.box
vagrant box list
```

```
cd ..
vagrant up
vagrant ssh
uname -r
```

```
vagrant destroy
vagrant box remove centos-7-5
```