# jason_blueROV
Mission and self-adaptive layer for BlueROV using Jason + ROS

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
