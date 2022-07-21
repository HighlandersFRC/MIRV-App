enum RoverSubsystemType { general, intake, drivetrain, movement, conveyor, sensors, heartbeat }
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

enum RoverCommandTypeIntake { disable, reset, intake, store, deposit, switch_left, switch_right }

enum RoverCommandTypeDrivetrain { arcade, tank }

enum RoverCommandTypeMovement { to_location }

extension RoverSubsytemType1 on RoverSubsystemType {
  dynamic get subCommands {}
}
