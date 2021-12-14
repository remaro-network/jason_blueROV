# jason_blueROV
Mission and self-adaptive layer for BlueROV using Jason + ROS

## Installing

To use metacontrol with Jason we need to download the tomasys asl file from the
jason_metacontrol repo. Jason doesn't have a library system, that is why we
need to download this file. There could be a hard copy of the file here in this
repo but to avoid duplicate development lets just download it. A clever way for
doing this will be thought in the future.

```
$ cd src/bluerov/
$ wget https://raw.githubusercontent.com/Rezenders/jason_metacontrol/main/src/mros/tomasys.asl
```

## Running

### SITL
In ArduSub repo:
```
$ sim_vehicle.py -L RATBeach --out=udp:0.0.0.0:14550 --map --console
```

### Jason

```
$ export ROS_IP=127.0.0.1
$ roslaunch jason_bluerov bluerov.launch
```
