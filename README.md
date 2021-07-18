# ET: Legacy dedicated server for VIPET
## Build

  `sudo docker build -t etlegacy .`

## Run

  `sudo docker run -p 27960:27960/udp etlegacy`

## Stop

  `sudo docker stop $(sudo docker ps -a -q)`

  All containers will stop.

## More info.

  (Japanese) [Wiki](https://github.com/hotpot774/etlegacy/wiki)の情報は2.77.1に対応していません。
