import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/ui/screens/home_page.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  AuthService authService = AuthService();
  final Rx<bool> isLoading = true.obs;

  // @override
  // void onInit() async {
  //   // Simulating obtaining the user name from some local storage
  //   super.onInit();
  // }

  Future<void> init() async {
    await authService.init();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value?.isEmpty == true) {
      return 'Empty';
    }
    return null;
  }

  void login() {
    attemptLogIn(usernameController.text, passwordController.text).then((code) {
      if (code == 200) {
        Get.snackbar('Login', 'Login successfully');
        Get.off(const RoverSelectionPage());
      } else if (code == 401 || code == 403) {
        Get.snackbar('Login', 'Invalid username or password');
      } else {
        Get.snackbar('Login', 'Unknown error: $code');
      }
    });
  }

  void validateToken() {
    isCurrentTokenValid().then((isValid) {
      isLoading.value = false;
      if (isValid) {
        Get.off(const RoverSelectionPage());
      }
    });
  }

  Future<int> attemptLogIn(String username, String password) async {
    return authService.authenticateUser(username, password);
  }

  Future<bool> isCurrentTokenValid() async {
    return authService.validateToken();
  }
}

class LoginPage extends StatelessWidget {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    controller.init().then((val) => controller.validateToken());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In Page"),
      ),
      body: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: controller.validator,
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: controller.validator,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: controller.login,
                child: const Text('Login'),
              )
            ],
          ),
        ),
        Obx(() => controller.isLoading.value
            ? Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container()),
      ]),
    );
    // body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     children: <Widget>[
    //       TextField(
    //         controller: _usernameController,
    //         decoration: InputDecoration(labelText: 'Username'),
    //       ),
    //       TextField(
    //         controller: _passwordController,
    //         obscureText: true,
    //         decoration: InputDecoration(labelText: 'Password'),
    //       ),
    //       ElevatedButton(
    //           onPressed: () async {
    //             var username = _usernameController.text;
    //             var statusCode = await attemptLogIn(username, _passwordController.text);
    //             if (statusCode == 200) {
    //               Get.offAll(const HomePage());
    //             } else {
    //               displayDialog(context, "Something went wrong", "No account was found matching that username and password");
    //             }
    //           },
    //           child: Text("Log In")),
    //     ],
    //   ),
    // ));
  }
}
