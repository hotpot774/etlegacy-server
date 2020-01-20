# Build
  1. Copy below files to the same directory.
  - etl_server.cfg
  - pak0.pk3
  - pak1.pk3
  - pak2.pk3

  2. Run a command below.

  `sudo docker build -t etlegacy .`

# Run

  `sudo docker run -e G_PASSWORD=[YOUR_SERVER_PASSWORD_HERE] -p 27960:27960/udp etlegacy`

# Stop
  All containers will stop.

  `sudo docker stop $(sudo docker ps -a -q)`

# Wiki
  [Wiki](https://github.com/hotpot774/etlegacy/wiki)にも少し書いた。(Japanese)
