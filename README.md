# streaming-scripts
Scripts for Streaming SAUVC videos on a Raspberry Pi
-------

These scripts can be used on a RaspberryPi to play videos on RaspberryPi immediately on boot. A level of indirection (`curl X | bash`) is added to ensure that the actual script to be executed can be replaced without needing to access the RaspberryPi.

## Dependencies

## Installation

1. Copy `runstream.sh` to the home directory of the RaspberryPi.

2. Change permissions to give the user execute access to `runstream.sh`

3. To ensure that the `runstream.sh` script runs at reboot, add a instruction the to cronttab

  Edit crontab using `crontab -e`. Add `@reboot /home/pi/runstream.sh > /var/log/stream.log 2>&1`


## runstream.sh

This script is run at boot and defines some global exports that can be used for identification and then it downloads a script from the internet and runs it.


## sauvcstream.sh

This script : 

- Hits a DuckDNS API to update it with the local IP. With this we can find the IP address that is assigned to the RaspberryPi.
- Get a streaming URL from the YouTube URL using [youtube-dl](https://rg3.github.io/youtube-dl/download.html) and plays it with [omxplayer](https://github.com/huceke/omxplayer)
- Loops through a list of previous years SAUVC videos and plays them in order.
