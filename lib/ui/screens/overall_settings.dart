import 'package:flutter/material.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:get/get.dart';

class SettingsTextBoxController extends GetxController {
  AuthService authService = AuthService();
  final endpointController = TextEditingController();
  final keycloakEndpointController = TextEditingController();
  final keycloakRealmController = TextEditingController();
  final keycloakClientController = TextEditingController();

  @override
  onInit() async {
    await authService.init();
    endpointController.text = authService.getMirvEndpoint() ?? '';
    keycloakEndpointController.text = authService.getKeycloakEndpoint() ?? '';
    keycloakRealmController.text = authService.getKeycloakRealm() ?? '';
    keycloakClientController.text = authService.getKeycloakClient() ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    endpointController.dispose();
    keycloakEndpointController.dispose();
    keycloakRealmController.dispose();
    keycloakClientController.dispose();
    super.onClose();
  }
}

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final settingsTextBoxController = Get.put(SettingsTextBoxController());

  AuthService authService = AuthService();

  final MirvApi mirvApi = MirvApi();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppBarColor.foregroundColor,
        shadowColor: AppBarColor.shadowColor,
        backgroundColor: AppBarColor.backgroundColor,
        title: const Text(
          "Settings",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const ListTile(
              title: Text('Language'), leading: Icon(Icons.language),
              //  onPressed: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              // builder: (BuildContext context) => LanguagePage()));
              //  },
            ),
            const ListTile(title: Text('Environment'), leading: Icon(Icons.cloud_queue)),
            const ListTile(title: Text('Email'), leading: Icon(Icons.email)),
            const ListTile(title: Text('Sign Out'), leading: Icon(Icons.exit_to_app)),
            const ListTile(title: Text('App Version: 1.0.0.')),
            ListTile(
              title: TextField(
                controller: settingsTextBoxController.endpointController,
                decoration: const InputDecoration(hintText: 'MIRV Endpoint address:'),
              ),
            ),
            ListTile(
              title: TextField(
                controller: settingsTextBoxController.keycloakEndpointController,
                decoration: const InputDecoration(hintText: 'Keycloak Endpoint:'),
              ),
            ),
            ListTile(
              title: TextField(
                controller: settingsTextBoxController.keycloakRealmController,
              ),
            ),
            ListTile(
              title: TextField(
                controller: settingsTextBoxController.keycloakClientController,
                decoration: const InputDecoration(hintText: 'Keycloak Client:'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  authService.setMirvEndpoint(settingsTextBoxController.endpointController.text);
                  authService.setKeycloakEndpoint(settingsTextBoxController.keycloakEndpointController.text);
                  authService.setKeycloakRealm(settingsTextBoxController.keycloakRealmController.text);
                  authService.setKeycloakClient(settingsTextBoxController.keycloakClientController.text);
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
