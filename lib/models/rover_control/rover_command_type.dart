enum RoverSubsystemType { general, intake, drivetrain, movement, heartbeat, pi_lit, garage }
// ignore: todo
// TODO: enhanced enum, integer sub_command, maps to different enum

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

enum RoverCommandTypeIntake { place_1_pi_lit, pickup_1_pi_lit }

enum RoverCommandTypePiLit { idle, wave, wave_reverse, simultaneous }

enum RoverCommandTypeDrivetrain { arcade, tank, to_location }

enum RoverCommandTypeMovement { to_location }

extension RoverSubsytemType1 on RoverSubsystemType {
  dynamic get subCommands {}
}
