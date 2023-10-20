# Coreos-Custom [Fedora CoreOS]

## Preparation

#### Clone Coreos-installer

https://github.com/coreos/coreos-installer

```
cd docker
git clone git@github.com:coreos/coreos-installer.git
cd ..
```

#### Clone Butane

https://github.com/coreos/butane

```
cd docker
git clone git@github.com:coreos/butane.git 
cd ..
```

#### Download Fedora CoreOS

https://www.fedoraproject.org/coreos/download and move it to `iso` folder


#### Update environment file

Update the `.env` file, the image name must match with the downloaded file from `iso` folder

```
IMAGE_NAME=fedora-coreos-38.20231002.3.1-live.x86_64.iso
```

## Build boot image

#### Generate config

```
docker compose up --no-log-prefix butane >config/config.json
```

#### Build boot image
```
docker compose up coreos
```

## Burn ISO to USB

Burn the generated image to usb using [etcher](https://etcher.balena.io/)

