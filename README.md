# jason_blueROV
Mission and self-adaptive layer for BlueROV using Jason + ROS

## Acknowledgements

<a href="https://remaro.eu/">
    <img height="60" alt="REMARO Logo" src="https://remaro.eu/wp-content/uploads/2020/09/remaro1-right-1024.png">
</a>

This work is part of the Reliable AI for Marine Robotics (REMARO) Project. For more info, please visist:  <a href="https://remaro.eu/">https://remaro.eu/

<br>

<a href="https://research-and-innovation.ec.europa.eu/funding/funding-opportunities/funding-programmes-and-open-calls/horizon-2020_en">
    <img align="left" height="60" alt="EU Flag" src="https://remaro.eu/wp-content/uploads/2020/09/flag_yellow_low.jpg">
</a>

This project has received funding from the European Union's Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No. 956200".

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
