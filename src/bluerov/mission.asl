/* Initial beliefs */
pitch(1500).
roll(1500).
throttle(1500).
yaw(1500).
forward(1500).
lateral(1500).
cameraPan(1500).
cameraTilt(1500).
lightLevel1(1500).
lightLevel2(1100).
videoSwitch(1500).

/* Initial goals */
// !set_fcu_param.
!start_mission.

/* Plans */
// still need to figure out what ID I should use and how to set it
// +!set_fcu_param
//   <- set_fcu_param("SYSID_MYGCS", 255, 0.0).

+!start_mission
  <-  .print("BlueROV is starting its mission! Move the fishes away!!!");
      .wait(state(_,"True",_));
      !setMode("MANUAL");
      !armMotor;
      .print("Lets swim");
      !!rc_override;
      !go_forward(0.5);
      .wait(4000);
      !go_forward(0);
      !go_lateral(0.5);
      .wait(3000);
      !go_forward(-0.5);
      !go_lateral(0);
      .wait(4000);
      !go_forward(0);
      !go_lateral(-0.5);
      .wait(3000);
      !go_forward(0);
      !go_lateral(0).

//Vel is a normalized value from -1 to 1
// 1 = full speed ahead
// 0 = zero speed
// -1 = full speed backwards
@go_forward[atomic]
+!go_forward(Vel)
  <-  .abolish(forward(_));
      +forward((1900-1500)*Vel + 1500).

@go_lateral[atomic]
+!go_lateral(Vel)
  <-  .abolish(lateral(_));
      +lateral((1900-1500)*Vel + 1500).

+!setMode(Mode) : not state(Mode,_,_,_)
	<- 	set_mode(Mode);
			.wait(state(Mode,_,_), 1000).

+!setMode(Mode).

-!setMode(Mode) <- !setMode(Mode).

+!armMotor : not state(Mode,_,"True")
	<-	arm_motors(True);
			.wait(state(Mode,_,"True"), 1000).

+!armMotor.

-!armMotor <- !armMotor.

// might be good to add to context something to enable this plan to stop
+!rc_override: pitch(Pitch) & roll(Roll) & throttle(Throttle) & yaw(Yaw) & forward(Forward) & lateral(Lateral) & cameraPan(CameraPan) & cameraTilt(CameraTilt) & lightLevel1(LightLevel1) & lightLevel2(LightLevel2) & videoSwitch(VideoSwitch)
  <-  rc_override([Pitch, Roll, Throttle, Yaw, Forward, Lateral, CameraPan, CameraTilt, LightLevel1, LightLevel2, VideoSwitch, 0, 0, 0, 0, 0, 0, 0]);
      .wait(500); //2hz
      !rc_override.
