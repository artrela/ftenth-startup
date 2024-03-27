# ftenth-startup

## Hokoyo Setup

In order to utilize the 10LX you must first configure the eth0 network. From the factory the 10LX is assigned the following ip: 192.168.0.10. Note that the lidar is on subnet 0.

**In the GUI:**

Under the identity tab change the name to "Hokuyo"

In the ipv4 tab:

*In the addresses area*
IP address 192.168.0.15
Subnet mask is 255.255.255.0
Gateway is 192.168.0.1



## Downloading VS Code

Put this link into the browser:
https://code.visualstudio.com/docs/?dv=linux64_deb 

Run the vscode.sh script as follows:
```bash
bash vscode.sh ~/Downloads/<downloaded-file>
```

## Creating Consistent References to VESC/Hokuyo


First, as root, open /etc/udev/rules.d/99-hokuyo.rules in a text editor to create a new rules file for the Hokuyo. Copy the following rule exactly as it appears below in a single line and save it:

```
sudo gedit /etc/udev/rules.d/99-hokuyo.rules

```

```
KERNEL=="ttyACM[0-9]*", ACTION=="add", ATTRS{idVendor}=="15d1", MODE="0666", GROUP="dialout", SYMLINK+="sensors/hokuyo"
```

Next, open /etc/udev/rules.d/99-vesc.rules and copy in the following rule for the VESC:

```
KERNEL=="ttyACM[0-9]*", ACTION=="add", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666", GROUP="dialout", SYMLINK+="sensors/vesc"
```


Finally, trigger (activate) the rules by running

```
sudo udevadm control --reload-rules
sudo udevadm trigger
```

Reboot your system, and you should find three new devices by running

```
ls /dev/sensors
```

and:

```
ls /dev/input
```