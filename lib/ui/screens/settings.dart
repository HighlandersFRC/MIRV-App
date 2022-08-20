import 'package:flutter/material.dart';
import 'package:mirv/constants/theme_data.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/services/mirv_api.dart';

import 'package:get/get.dart';
import 'package:mirv/ui/screens/home_page.dart';

class SettingsTextBoxController extends GetxController {
  AuthService authService = AuthService();
  final endpointController = TextEditingController().obs;
  final keycloakEndpointController = TextEditingController().obs;
  final keycloakRealmController = TextEditingController().obs;
  final keycloakClientController = TextEditingController().obs;
  Rx<String> savedEndpoint = ''.obs;
  Rx<String> savedKeycloakEndpoint = ''.obs;
  Rx<String> savedKeycloakRealm = ''.obs;
  Rx<String> savedKeycloakClient = ''.obs;

  initialize() {
    savedEndpoint.value = (authService.getMirvEndpoint());
    savedKeycloakEndpoint.value = (authService.getKeycloakEndpoint());
    savedKeycloakRealm.value = (authService.getKeycloakRealm());
    savedKeycloakClient.value = (authService.getKeycloakClient());

    if (endpointController.value.text != savedEndpoint.value) {
      endpointController.value.text = savedEndpoint.value;
    }
    if (keycloakEndpointController.value.text != savedKeycloakEndpoint.value) {
      keycloakEndpointController.value.text = savedKeycloakEndpoint.value;
    }
    if (keycloakRealmController.value.text != savedKeycloakRealm.value) {
      keycloakRealmController.value.text = savedKeycloakRealm.value;
    }
    if (keycloakClientController.value.text != savedKeycloakClient.value) {
      keycloakClientController.value.text = savedKeycloakClient.value;
    }
  }

  @override
  void onInit() async {
    await authService.init();
    initialize();
    super.onInit();
  }

  @override
  void onClose() {
    endpointController.value.dispose();
    keycloakEndpointController.value.dispose();
    keycloakRealmController.value.dispose();
    keycloakClientController.value.dispose();
    super.onClose();
  }
}

// ignore: must_be_immutable
class SettingsPage extends StatelessWidget {
  Rx<bool> loading = false.obs;
  Rx<bool> compareOriginEndpoint = true.obs;
  Rx<bool> compareOriginKeycloakEndpoint = true.obs;
  Rx<bool> compareOriginKeycloakRealm = true.obs;
  Rx<bool> compareOriginKeycloakClient = true.obs;

  final settingsTextBoxController = Get.put(SettingsTextBoxController());

  SettingsPage({Key? key}) : super(key: key) {
    // settingsTextBoxController.initialize();
  }

  AuthService authService = AuthService();

  late GarageMetrics garageMetrics;

  late MirvApi mirvApi = MirvApi();

  ListTile _textFieldtile(
      {required Rx<TextEditingController> controller,
      required Rx<String> savedValue,
      required Rx<bool> compareOrigin,
      required String labelText}) {
    return ListTile(
      title: Obx(
        () => TextField(
          controller: controller.value,
          onChanged: (text) {
            compareOrigin.value = savedValue.value == text;
          },
          decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: compareOrigin.value ? secondaryColor : Colors.red)),
          ),
        ),
      ),
      trailing: Obx(
        () => ElevatedButton(
          onPressed: compareOrigin.value
              ? null
              : () {
                  if (!compareOrigin.value) {
                    controller.value.text = savedValue.value;
                    compareOrigin.value = true;
                  }
                },
          child: const Text('Reset'),
        ),
      ),
    );
  }

  Future _unsavedDialog(List<String> unsavedValues) {
    return Get.dialog(
      AlertDialog(
        title: const Text('Unsaved Changes'),
        content: Text('You have unsaved to the following variables: ${unsavedValues.join(", ")}'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back')),
          ElevatedButton(
              onPressed: () {
                Get.offAll(HomePage());
              },
              child: const Text('Continue'))
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              List<String> variableList = [];

              if (!compareOriginEndpoint.value) {
                variableList.add('MIRV Cloud API');
              }
              if (!compareOriginKeycloakEndpoint.value) {
                variableList.add('Keycloak Endpoint');
              }
              if (!compareOriginKeycloakRealm.value) {
                variableList.add('Keycloak Realm');
              }
              if (!compareOriginKeycloakClient.value) {
                variableList.add('Keycloak Client');
              }
              if (variableList.isNotEmpty) {
                _unsavedDialog(variableList);
              } else {
                Get.offAll(HomePage());
              }
            }),
        title: const Text(
          "Settings",
        ),
      ),
      body: Stack(
        children: [
          Scrollbar(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  _textFieldtile(
                      controller: settingsTextBoxController.endpointController,
                      savedValue: settingsTextBoxController.savedEndpoint,
                      compareOrigin: compareOriginEndpoint,
                      labelText: 'MIRV Cloud Api'),
                  _textFieldtile(
                      controller: settingsTextBoxController.keycloakEndpointController,
                      savedValue: settingsTextBoxController.savedKeycloakEndpoint,
                      compareOrigin: compareOriginKeycloakEndpoint,
                      labelText: 'Keycloak Endpoint'),
                  _textFieldtile(
                      controller: settingsTextBoxController.keycloakRealmController,
                      savedValue: settingsTextBoxController.savedKeycloakRealm,
                      compareOrigin: compareOriginKeycloakRealm,
                      labelText: 'Keycloak Realm'),
                  _textFieldtile(
                      controller: settingsTextBoxController.keycloakClientController,
                      savedValue: settingsTextBoxController.savedKeycloakClient,
                      compareOrigin: compareOriginKeycloakClient,
                      labelText: 'Keycloak Client'),
                  Obx(
                    () => ElevatedButton(
                        onPressed: compareOriginEndpoint.value &&
                                compareOriginKeycloakEndpoint.value &&
                                compareOriginKeycloakRealm.value &&
                                compareOriginKeycloakClient.value
                            ? null
                            : () async {
                                //pop ups
                                loading.value = true;
                                if (!await mirvApi.testEndpoint(settingsTextBoxController.endpointController.value.text)) {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text('Invalid Input'),
                                      content: const Text('Invalid Endpoint'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('Okay'))
                                      ],
                                    ),
                                  );
                                } else if (!await mirvApi
                                    .testEndpoint(settingsTextBoxController.keycloakEndpointController.value.text)) {
                                  authService.setMirvEndpoint(settingsTextBoxController.endpointController.value.text);
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text('Invalid Input'),
                                      content: const Text('Invalid Keycloak Endpoint'),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('Okay'))
                                      ],
                                    ),
                                  );
                                } else {
                                  authService.setMirvEndpoint(settingsTextBoxController.endpointController.value.text);
                                  authService
                                      .setKeycloakEndpoint(settingsTextBoxController.keycloakEndpointController.value.text);

                                  authService.setKeycloakRealm(settingsTextBoxController.keycloakRealmController.value.text);
                                  authService.setKeycloakClient(settingsTextBoxController.keycloakClientController.value.text);
                                  //setting saved variable
                                  settingsTextBoxController.savedEndpoint.value = authService.getMirvEndpoint();
                                  settingsTextBoxController.savedKeycloakEndpoint.value = authService.getKeycloakEndpoint();
                                  settingsTextBoxController.savedKeycloakRealm.value = authService.getKeycloakRealm();
                                  settingsTextBoxController.savedKeycloakClient.value = authService.getKeycloakClient();

                                  compareOriginEndpoint.value = true;
                                  compareOriginKeycloakEndpoint.value = true;
                                  compareOriginKeycloakRealm.value = true;
                                  compareOriginKeycloakClient.value = true;
                                }
                                loading.value = false;
                              },
                        child: const Text('Save')),
                  )
                ],
              ),
            ),
          ),
          Obx(() => loading.value
              ? Center(child: Container(color: loadingColor, child: const Center(child: CircularProgressIndicator())))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
