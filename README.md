# ET: Legacy dedicated server
## Build

  1. Copy pak0.pk3, pak1.pk3 and pak2.pk3 from original ET to the "etmain" directory.

  2. Run a command below.

  `sudo docker build -t etlegacy .`

## Run

  `sudo docker run -e G_PASSWORD=[YOUR_SERVER_PASSWORD_HERE] -p 27960:27960/udp etlegacy`

  You can set a server password to "[YOUR_SERVER_PASSWORD_HERE]" if you need.

## Stop
  All containers will stop.

  `sudo docker stop $(sudo docker ps -a -q)`

## More info.
  (Japanese) [Wiki](https://github.com/hotpot774/etlegacy/wiki)にも少し書いた。
