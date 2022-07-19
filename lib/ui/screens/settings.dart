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
      body: Scrollbar(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.endpointController,
                  decoration: const InputDecoration(labelText: 'MIRV Cloud Endpoint:'),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.keycloakEndpointController,
                  decoration: const InputDecoration(labelText: 'Keycloak Endpoint:'),
                ),
              ),
              ListTile(
                title: TextField(
                    controller: settingsTextBoxController.keycloakRealmController,
                    decoration: const InputDecoration(labelText: 'Keycloak Realm:')),
              ),
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.keycloakClientController,
                  decoration: const InputDecoration(labelText: 'Keycloak Client:'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    authService.setMirvEndpoint(settingsTextBoxController.endpointController.text);
                    authService.setKeycloakEndpoint(settingsTextBoxController.keycloakEndpointController.text);
                    authService.setKeycloakRealm(settingsTextBoxController.keycloakRealmController.text);
                    authService.setKeycloakClient(settingsTextBoxController.keycloakClientController.text);
                    Get.snackbar('Settings', 'Successfully saved settings');
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
