import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/services/auth_service.dart';

class LoginController extends GetxController {
  final Widget pageRoute;
  LoginController(this.pageRoute);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  AuthService authService = AuthService();

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
        Get.off(pageRoute);
      } else if (code == 401 || code == 403) {
        Get.snackbar('Login', 'Invalid username or password');
      } else {
        Get.snackbar('Login', 'Unknown error: $code');
      }
    });
  }

  Future<int> attemptLogIn(String username, String password) async {
    return authService.authenticateUser(username, password);
  }
}

class LoginPage extends StatelessWidget {
  late LoginController controller = LoginController(pageRoute);
  final Widget pageRoute;
  final Rx<bool> _isObscure = true.obs;
  LoginPage(this.pageRoute, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In Page"),
      ),
      body: ListView(
        children: [
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
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
