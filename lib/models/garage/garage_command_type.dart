enum GarageSubsystemType { general }
// TODO: enhanced enum, integer sub_command, maps to different enum

enum GarageCommandType { lock, unlock, retract, deploy, lights_on, lights_off }

// enum GarageCommandTypeIntake { disable, reset, intake, store, deposit, switch_left, switch_right }

// enum GarageCommandTypeDrivetrain { arcade, tank }

// enum GarageCommandTypeMovement { to_location }

extension GarageSubsytemType1 on GarageSubsystemType {
  dynamic get subCommands {}
}
