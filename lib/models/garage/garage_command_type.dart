enum GarageSubsystemType { general }
// TODO: enhanced enum, integer sub_command, maps to different enum

enum GarageCommandType { lock, unlock, retract, deploy, lights_on, lights_off }

extension GarageSubsytemType1 on GarageSubsystemType {
  dynamic get subCommands {}
}
