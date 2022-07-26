import 'package:flutter/material.dart';
import 'package:mirv/constants/settings_default.dart';
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

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  Rx<bool> resetButtonEnableEndpoint = false.obs;
  Rx<bool> resetButtonEnableKeycloakEndpoint = false.obs;
  Rx<bool> resetButtonEnableKeycloakRealm = false.obs;
  Rx<bool> resetButtonEnableKeycloakClient = false.obs;

  SettingsPage({Key? key}) : super(key: key);
  final settingsTextBoxController = Get.put(SettingsTextBoxController());

  AuthService authService = AuthService();

  final MirvApi mirvApi = MirvApi();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppThemeColor.foregroundColor,
        shadowColor: AppThemeColor.shadowColor,
        backgroundColor: AppThemeColor.backgroundColor,
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
                  onChanged: (_) {
                    resetButtonEnableEndpoint.value = true;
                  },
                ),
                trailing: Obx(
                  () => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(resetButtonEnableEndpoint.value ? Colors.blue : Colors.grey),
                      ),
                      onPressed: () {
                        resetButtonEnableEndpoint.value
                            ? settingsTextBoxController.endpointController.text = SettingsDefaults.endpoint
                            : null;
                      },
                      child: Text('Reset')),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.keycloakEndpointController,
                  decoration: const InputDecoration(labelText: 'Keycloak Endpoint:'),
                  onChanged: (_) {
                    resetButtonEnableKeycloakEndpoint.value = true;
                  },
                ),
                trailing: Obx(
                  () => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(resetButtonEnableKeycloakEndpoint.value ? Colors.blue : Colors.grey),
                      ),
                      onPressed: () {
                        resetButtonEnableKeycloakEndpoint.value
                            ? settingsTextBoxController.keycloakEndpointController.text = SettingsDefaults.endpoint
                            : null;
                      },
                      child: Text('Reset')),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.keycloakRealmController,
                  decoration: const InputDecoration(labelText: 'Keycloak Realm:'),
                  onChanged: (_) {
                    resetButtonEnableKeycloakRealm.value = true;
                  },
                ),
                trailing: Obx(
                  () => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(resetButtonEnableKeycloakRealm.value ? Colors.blue : Colors.grey),
                      ),
                      onPressed: () {
                        resetButtonEnableKeycloakRealm.value
                            ? settingsTextBoxController.keycloakRealmController.text = SettingsDefaults.endpoint
                            : null;
                      },
                      child: Text('Reset')),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: settingsTextBoxController.keycloakClientController,
                  decoration: const InputDecoration(labelText: 'Keycloak Client:'),
                  onChanged: (_) {
                    resetButtonEnableKeycloakClient.value = true;
                  },
                ),
                trailing: Obx(
                  () => ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(resetButtonEnableKeycloakClient.value ? Colors.blue : Colors.grey),
                      ),
                      onPressed: () {
                        resetButtonEnableKeycloakClient.value
                            ? settingsTextBoxController.keycloakRealmController.text = SettingsDefaults.endpoint
                            : null;
                      },
                      child: Text('Reset')),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (mirvApi.testEndpoint(settingsTextBoxController.endpointController.text) == true) {
                      authService.setMirvEndpoint(settingsTextBoxController.endpointController.text);
                    }

                    if (mirvApi.testEndpoint(settingsTextBoxController.keycloakEndpointController.text) == true) {
                      authService.setKeycloakEndpoint(settingsTextBoxController.keycloakEndpointController.text);
                    }

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
