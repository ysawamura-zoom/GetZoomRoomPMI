<h2>Zoom - Get ZoomRoom PMI number using API</h2>

Shell script to print out PMI number for each ZoomRoom using API.<br>
This script will require "jq".<br>
tested on MacOS 10.14.<br>
1. Get the token from Zoom's Marketplace and place it.<br>
2. Change the permission to 755 and run it<br>
[EXAMPLE]<br>
------------------------------------------<br>
brew install jq<br>
chmod 755 ./get_ZR_PMI.sh<br>
./get_ZR_PMI.sh<br>
------------------------------------------<br>

[DOCUMENTS]<br>
List Zoom Rooms
　https://marketplace.zoom.us/docs/api-reference/zoom-api/rooms/listzoomrooms<br>
Get a Specific User
　https://marketplace.zoom.us/docs/api-reference/zoom-api/users/user<br>
