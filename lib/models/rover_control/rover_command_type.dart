enum RoverSubsystemType { general, intake, drivetrain, conveyor, sensors }

enum RoverCommandTypeGeneral { deploy, stow, enable, disable, e_stop, deploy_pi_lits, retrieve_pi_lits, enable_remote_operation }

enum RoverCommandTypeIntake { disable, reset, intake, store, deposit, switch_left, switch_right }

enum RoverCommandTypeDrivetrain { arcade, tank }

extension RoverSubsytemType1 on RoverSubsystemType {
  dynamic get subCommands {}
}
