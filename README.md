# docker.esp8266
Dockerfile to create image with git, python, nodejs, coffeescript, lua, luarocks, moonscript, minicom, esptool, luatool, NodeMCU-Tool for esp8266 programming

## start container
```
docker run -it --device /dev/ttyUSB0 twhtanghk/docker.esp8266
```

## flash firmware
```
~/esptool/esptool.py write_flash 0x00000 nodemcu-xxxx.bin
```

## compile, mkfs, or upload
```
cd ~/src
moonc *.moon
nodemcu-tool mkfs
nodemcu-tool upload *.lua
```
