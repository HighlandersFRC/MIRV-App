// ignore_for_file: constant_identifier_names

enum RoverSubsystemType { general, intake, drivetrain, heartbeat, pi_lit, garage, camera }
// ignore: todo
// TODO: enhanced enum, integer sub_command, maps to different enum

enum RoverCommandType {
  // General Commands
  deploy,
  cancel,
  stow,
  enable,
  disable,
  e_stop,
  start_manual_control,
  stop_manual_control,
  deploy_pi_lits,
  retrieve_pi_lits,
  enable_remote_operation,
  disable_remote_operation,

  // Heartbeat Commands
  heartbeat,

  // Intake Commands
  place_1_pi_lit,
  pickup_1_pi_lit,
  unload_pi_lits,
  load_pi_lits,
  deploy_intake,
  retract_intake,

  // PiLit Commands
  idle,
  wave,
  wave_reverse,
  simultaneous,
  set_number_pi_lits,

  // Drivetrain Commands
  arcade,
  tank,
  to_location,

  // Camera Commands
  switch_camera,
}

enum RoverCommandTypeGeneral {
  deploy,
  cancel,
  stow,
  enable,
  disable,
  e_stop,
  start_manual_control,
  stop_manual_control,
  deploy_pi_lits,
  retrieve_pi_lits,
  enable_remote_operation,
  disable_remote_operation
}

enum RoverCommandTypeHeartbeat { heartbeat }

enum RoverCommandTypeIntake { place_1_pi_lit, pickup_1_pi_lit, unload_pi_lits, load_pi_lits, deploy_intake, retract_intake }

enum RoverCommandTypePiLit { idle, wave, wave_reverse, simultaneous, set_number_pi_lits }

enum RoverCommandTypePiLitDeploy { taper_right_3, taper_left_3, taper_right_5, taper_left_5, spear_7 }

enum RoverCommandTypeDrivetrain { arcade, tank, to_location }

enum RoverCommandTypeMovement { to_location }

enum RoverCommandTypeCamera { switch_camera }

extension RoverSubsytemType1 on RoverSubsystemType {
  dynamic get subCommands {}
}
