# Docker Swarm Vagrant Variations By Code-Machina

Hi, My name is Code-Machina (a.k.a CoMa). Developing Swarm application stacks, I found this wonderful script which use vagrant, and virtualbox.

So, I modified some script 

I'm security engineer,

# Requirements

- Windows 10
- Virtualbox
- Vagrant
- Choco

# Instructions

## Install choco

- googling and install choco for windows msi

## Install vagrant

- if you had installed choco, It's easier than before.

```
choco install vagrant
```

## Windows Vagrant

- Auto mode

By default, vagrant will not install docker.

You can run `AUTO_START_SWARM=true vagrant up` to provision swarm automatically.

```powershell
# Powershell for Windows 10
$AUTO_START_SWARM='true'; vagrant up 
```

## Reset Everything

- Destory

```
cd ./vagrant-for-docker-ce-and-swarm-cluster
vagrant destroy
```