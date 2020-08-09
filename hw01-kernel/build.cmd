cd /d "%~dp0"

@echo ---------------- CLEAN ----------------

if exist packer\packer_cache rmdir /q /s packer\packer_cache

if exist packer\centos-7.7.1908-kernel-5-x86_64-Minimal.box del packer\centos-7.7.1908-kernel-5-x86_64-Minimal.box

@echo ---------------- DESTROY VM ----------------
vagrant status
vagrant halt -f
vagrant destroy -f
vagrant status

@echo ---------------- BUILD BOX ----------------
cd packer
packer build centos.json
  
@echo ---------------- ADD BOX ----------------
vagrant box list
vagrant box remove centos-7-5

vagrant box add --name centos-7-5 centos-7.7.1908-kernel-5-x86_64-Minimal.box
vagrant box list

cd ..

vagrant status
