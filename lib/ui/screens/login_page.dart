// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/main.dart';
import 'package:mirv/services/auth_service.dart';

class LoginController extends GetxController {
  final Function() onLogin;
  LoginController(this.onLogin);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  AuthService authService = AuthService();
  Rx<bool> isLoading = true.obs;

  Future<void> init() async {
    await authService.init();
    usernameController.text = await authService.getUsername();
    passwordController.text = await authService.getPassword();
    login();
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
    isLoading.value = true;
    attemptLogIn(usernameController.text, passwordController.text).then((code) {
      switch (code) {
        case 200:
          authService.setUsername(usernameController.text);
          authService.setPassword(passwordController.text);
          onLogin();
          break;
        case 401:
        case 403:
          notificationController.queueNotification('Login', 'Invalid username or password');
          break;
        case 408:
          notificationController.queueNotification('Login', 'Request Timed Out');
          break;
        default:
          notificationController.queueNotification('Login', 'Unknown error: $code');
          break;
      }
    });
    isLoading.value = false;
  }

  Future<int> attemptLogIn(String username, String password) async {
    return authService.authenticateUser(username, password);
  }

  Future<bool?> isCurrentTokenValid() async {
    return authService.isTokenExpired();
  }
}

class LoginPage extends StatelessWidget {
  final Function() onLogin;
  final Rx<bool> _isObscure = true.obs;
  late LoginController controller = LoginController(onLogin);
  LoginPage(this.onLogin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In Page"),
      ),
      body: ListView(
        children: [
          Stack(children: <Widget>[
            Scrollbar(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                      validator: controller.validator,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        validator: controller.validator,
                        obscureText: _isObscure.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure.value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              _isObscure.value = !_isObscure.value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: controller.login,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Login', style: TextStyle(fontSize: fontSizeButton)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Obx(() => controller.isLoading.value
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container()),
          ])
        ],
      ),
    );
  }
}
