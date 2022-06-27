# MIRV-App
Repository for MIRV mobile app code

Demo project tutorial: [100ms.live](https://www.100ms.live/blog/flutter-webrtc#access-camera-and-microphone-on-ios)



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
