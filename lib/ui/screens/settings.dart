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
  final keycloakClientSecretController = TextEditingController().obs;
  Rx<String> savedEndpoint = ''.obs;
  Rx<String> savedKeycloakEndpoint = ''.obs;
  Rx<String> savedKeycloakRealm = ''.obs;
  Rx<String> savedKeycloakClient = ''.obs;
  Rx<String> savedKeycloakClientSecret = ''.obs;
  Rx<bool> savedUseStunServer = true.obs;
  Rx<bool> useStunServerVal = true.obs;

  initialize() async {
    savedEndpoint.value = await authService.getMirvEndpoint();
    savedKeycloakEndpoint.value = await authService.getKeycloakEndpoint();
    savedKeycloakRealm.value = await authService.getKeycloakRealm();
    savedKeycloakClient.value = await authService.getKeycloakClient();
    savedKeycloakClientSecret.value = await authService.getKeycloakClientSecret();
    savedUseStunServer.value = await authService.getUseStunServer();
    useStunServerVal.value = savedUseStunServer.value;

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
    if (keycloakClientSecretController.value.text != savedKeycloakClientSecret.value) {
      keycloakClientSecretController.value.text = savedKeycloakClientSecret.value;
    }
  }

  @override
  void onInit() async {
    await authService.init();
    await initialize();
    super.onInit();
  }

  @override
  void onClose() {
    endpointController.value.dispose();
    keycloakEndpointController.value.dispose();
    keycloakRealmController.value.dispose();
    keycloakClientController.value.dispose();
    keycloakClientSecretController.value.dispose();
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
  Rx<bool> compareOriginKeycloakClientSecret = true.obs;
  Rx<bool> compareUseStunServer = true.obs;

  final settingsTextBoxController = Get.put(SettingsTextBoxController());

  SettingsPage({Key? key}) : super(key: key);

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
              if (!compareOriginKeycloakClientSecret.value) {
                variableList.add('Keycloak Client Secret');
              }
              if (!compareUseStunServer.value) {
                variableList.add('Use Stun Server');
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
                  _textFieldtile(
                      controller: settingsTextBoxController.keycloakClientSecretController,
                      savedValue: settingsTextBoxController.savedKeycloakClientSecret,
                      compareOrigin: compareOriginKeycloakClientSecret,
                      labelText: 'Keycloak Client Secret'),
                  ListTile(
                    title: Row(
                      children: [
                        const Text("Use Stun Server"),
                        Obx(() => Switch(
                              value: settingsTextBoxController.useStunServerVal.value,
                              onChanged: (val) {
                                settingsTextBoxController.useStunServerVal.value = val;
                                compareUseStunServer.value = settingsTextBoxController.useStunServerVal.value ==
                                    settingsTextBoxController.savedUseStunServer.value;
                              },
                            )),
                      ],
                    ),
                    trailing: Obx(
                      () => ElevatedButton(
                        onPressed: compareUseStunServer.value
                            ? null
                            : () {
                                if (!compareUseStunServer.value) {
                                  settingsTextBoxController.useStunServerVal.value =
                                      settingsTextBoxController.savedUseStunServer.value;
                                  compareUseStunServer.value = true;
                                }
                              },
                        child: const Text('Reset'),
                      ),
                    ),
                  ),
                  Obx(
                    () => ElevatedButton(
                        onPressed: compareOriginEndpoint.value &&
                                compareOriginKeycloakEndpoint.value &&
                                compareOriginKeycloakRealm.value &&
                                compareOriginKeycloakClient.value &&
                                compareOriginKeycloakClientSecret.value &&
                                compareUseStunServer.value
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
                                  authService.setKeycloakClientSecret(
                                      settingsTextBoxController.keycloakClientSecretController.value.text);
                                  authService.setUseStunServer(settingsTextBoxController.useStunServerVal.value);
                                  //setting saved variable
                                  settingsTextBoxController.savedEndpoint.value = await authService.getMirvEndpoint();
                                  settingsTextBoxController.savedKeycloakEndpoint.value = await authService.getKeycloakEndpoint();
                                  settingsTextBoxController.savedKeycloakRealm.value = await authService.getKeycloakRealm();
                                  settingsTextBoxController.savedKeycloakClient.value = await authService.getKeycloakClient();
                                  settingsTextBoxController.savedKeycloakClientSecret.value =
                                      await authService.getKeycloakClientSecret();
                                  settingsTextBoxController.savedUseStunServer.value = await authService.getUseStunServer();

                                  compareOriginEndpoint.value = true;
                                  compareOriginKeycloakEndpoint.value = true;
                                  compareOriginKeycloakRealm.value = true;
                                  compareOriginKeycloakClient.value = true;
                                  compareOriginKeycloakClientSecret.value = true;
                                  compareUseStunServer.value = true;
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
