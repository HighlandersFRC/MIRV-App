import 'package:flutter/material.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/ui/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text(title), content: Text(text)),
      );

  Future<int> attemptLogIn(String username, String password) async {
    var authService = await AuthService.getInstance();
    return authService!.authenticateUser(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log In Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var username = _usernameController.text;
                    var statusCode = await attemptLogIn(username, _passwordController.text);
                    if (statusCode == 200) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    } else {
                      displayDialog(context, "Something went wrong", "No account was found matching that username and password");
                    }
                  },
                  child: Text("Log In")),
            ],
          ),
        ));
  }
}
