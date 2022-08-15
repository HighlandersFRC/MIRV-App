enum GarageSubsystemType { general }
// TODO: enhanced enum, integer sub_command, maps to different enum

// ignore: constant_identifier_names
enum GarageCommandType { lock, unlock, retract, deploy, lights_on, lights_off, stop }

extension GarageSubsytemType1 on GarageSubsystemType {
  dynamic get subCommands {}
}
