This is how I use an Amazon Dash Button to trigger my lights to turn off / house to lock up when I leave.

On my router I have a destination-NAT configured such that any connections from the Dash (I've configured it w/a static IP in my DHCP configuration) are instead connected to a Rasberry PI running 'dash.rb`.

```
/ip firewall nat
add action=dst-nat chain=dstnat protocol=tcp src-address=192.168.1.65 to-addresses=192.168.1.2 to-ports=8081
```

dash.rb listens on port 8081 and calls a shell script whenever a connection is made.  This does mean anyone on my home network can trigger the behavior, but they could also click the lightswitches themselves.

leaving.sh sources a shell file containing the ZWay user / pass / ip, then calls the ZWay API to turn on a light, then turns off all lights and lock the doors after a timer.
