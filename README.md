# MIRV-App
Repository for MIRV mobile app code

Demo project tutorial: [100ms.live](https://www.100ms.live/blog/flutter-webrtc#access-camera-and-microphone-on-ios)


## Command Examples
| Command Name             | Description                                                                       | Initial State                                 | Final State                                   | Example                                                                                                                                                  |
| ------------------------ | --------------------------------------------------------------------------------- | --------------------------------------------- | --------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| E-Stop                   | E-stop rover                                                                      | any                                           | e_stop                                        | {"command":"e_stop","subsystem":"general","runtimeType":"generalCommand"}                                                                                |
| Disable                  | Soft stop: put rover in disabled state                                            | connected_idle_roaming, connected_idle_docked | disabled                            | {"command":"disable","subsystem":"general","runtimeType":"generalCommand"}                                                                               |
| Enable                   | Take rover out of disabled state, allow actions                                   | disabled                            | connected_idle_roaming, connected_idle_docked | {"command":"enable","subsystem":"general","runtimeType":"generalCommand"}                                                                                |
| Deploy                   | Deploy rover from garage                                                          | connected_idle_docked                         | connected_idle_roaming                        | {"command":"deploy","subsystem":"general","runtimeType":"generalCommand"}                                                                                |
| Stow                     | Stow rover in garage. Return to garage, enter garage, and lift garage             | connected_idle_roaming                        | connected_idle_docked                         | {"command":"stow","subsystem":"general","runtimeType":"generalCommand"}                                                                                  |
| Cancel                   | Stop autonomous command (pi-lit placement)                                        | autonomous                                    | connected_idle_roaming                        | {"command":"cancel","subsystem":"general","runtimeType":"generalCommand"}                                                                                |
| Deploy Pi-Lits           | Deploy Pi-lits. Set formation and start location                                  | connected_idle_roaming                        | autonomous                                    | {"command":"deploy_pi_lits","subsystem":"general","runtimeType":"generalCommand"}                                                                        |
| Retrieve Pi-lits         | Retrieve all placed Pi-lits                                                       | connected_idle_roaming                        | autonomous                                    | {"command":"retrieve_pi_lits","subsystem":"general","runtimeType":"generalCommand"}                                                                      |
| Enable Remote Operation  | Enable direct user control (joysticks)                                            | connected_idle_roaming                        | remote_operation                              | {"command":"enable_remote_operation","subsystem":"general","runtimeType":"generalCommand"}                                                               |
| Disable Remote Operation | Disable direct user control                                                       | remote_operation                              | connected_idle_roaming                        | {"command":"disable_remote_operation","subsystem":"general","runtimeType":"generalCommand"}                                                              |
| Heartbeat                | Used to ensure the connection is still open                                       | any                                           | any                                           | {"command":"heartbeat","subsystem":"heartbeat","runtimeType":"heartbeatCommand"}                                                                         |
| Pickup 1 Pi-Lit          | Requires remote_operation, tell rover to find and pick up the nearese Pi-Lit      | remote_operation                              | remote_operation                              | {"command":"pickup_1_pi_lit","subsystem":"intake","runtimeType":"intakeCommand"}                                                                         |
| Place 1 Pi-Lit           | Requires remote_operation, tell rover to place one Pi-Lit at its current location | remote_operation                              | remote_operation                              | {"command":"place_1_pi_lit","subsystem":"intake","runtimeType":"intakeCommand"}                                                                          |
| Drive Rover              | Requires remote_oepration, drive rover with joysticks/gamepad                     | remote_operation                              | remote_operation                              | {"command":"arcade","commandParameters":{"x":0.0,"y":0.0,"runtimeType":"drivetrain"},"subsystem":"drivetrain","runtimeType":"drivetrainCommand"}         |
| Move Rover               | Tell rover to navigate to a new location                                          | connected_idle_roaming                        | autonomous                                    | {"command":"to_location","commandParameters":{"lat":39.0,"long":-105.0,"runtimeType":"movement"},"subsystem":"movement","runtimeType":"movementCommand"} |

### Notes:
The runtimeType is not intended to be used, please ignore it.

## Development Environment (Windows)

Video tutorial for all described steps: https://www.youtube.com/playlist?list=PL__UlMMmv_rzDm5i-_HXiQ5YoQKsyurfA

You will need the following software packages:
- Flutter
- Android Studio
- VS Code


### Flutter
[Flutter Download](https://docs.flutter.dev/get-started/install/windows)

Must be installed and added to system path
You can test your installation by running the following command in powershell:
```
flutter
```
It should print a large page of white text. If it fails, it will print red text, likely starting with: flutter : The term 'flutter' is not recognized as the name of a cmdlet, function, script file, or operable program.
this means that you did not add it to your system path correctly, or you just need to close and restart powershell

### Android Studio
[Android Studio Download](https://developer.android.com/studio/install)

Must be installed, and you must be able to use the AVD manager to [launch/manage emulated android devices](https://developer.android.com/studio/run/emulator)

### VS Code
[VS Code Download](https://code.visualstudio.com/download)

You must install VS code, and add the [flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter#:~:text=This%20VS%20Code%20extension%20adds,menu%20for%20full%20debugging%20functionality.)


## Creating/Running Your First Flutter Project
[Video tutorial](https://www.youtube.com/watch?v=Xzjnqhu6SHM&list=PL__UlMMmv_rzDm5i-_HXiQ5YoQKsyurfA&index=3)

1. Launch Android Studio and in the AVD manager, launch an emulator
2. Launch VS Code
3. In VS Code, hit `CTRL + SHIFT + P`, then search for `Flutter: New Project`. Select Application, then create/select the folder in which to create the new project (like 'github'). Then enter the name of the new project
4. When you see a popup for "use recommended flutter/dart settings", select yes. This will install an auto code formatter and some intellisense packages, very convenient. Every time you save your code with `CRTL + S`, it will re-format the document, if it is error-free. This will be a requirement for all developers
5. After that command finishes (sometimes it stalls, and you can fix it by clicking in the VS code window somewhere), select the emulator you just launched (bottom right corner). You might have to open the src/main.dart file for this option to be available
6. Then, hit the "Run and Debug" play button in the top right. This will begin building the application, and will deploy it to the emulator when finished
7. The app should open on the emulator! Press the bottom right floating action button to test the app, the number in the center of the screen should increment


## Google Codelabs Tutorial
[tutorial](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1#2)

This tutorial will have you create a new sample application, beginning with a flutter command. To execute this command, open powershell, navigate to the directory in which you want to create the app, and then run the commands 
```
flutter create startup_namer
cd startup_namer
```
(Only specifying because the $ signs in the tutorial are confusing)
Follow the tutorial, and after you are done, complete part 2

## Freezed
To build the freezed classes run the following command:
```
flutter pub run build_runner build --delete-conflicting-outputs
```