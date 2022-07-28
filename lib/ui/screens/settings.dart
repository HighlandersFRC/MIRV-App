import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mirv/constants/settings_default.dart';
import 'package:mirv/services/auth_service.dart';
import 'package:mirv/services/mirv_api.dart';
import 'package:mirv/ui/screens/app_bar_theme.dart';
import 'package:get/get.dart';

class SettingsTextBoxController extends GetxController {
  AuthService authService = AuthService();
  final endpointController = TextEditingController().obs;
  final keycloakEndpointController = TextEditingController().obs;
  final keycloakRealmController = TextEditingController().obs;
  final keycloakClientController = TextEditingController().obs;
  late Rx<String> savedEndpoint;
  late Rx<String> savedKeycloakEndpoint;
  late Rx<String> savedKeycloakRealm;
  late Rx<String> savedKeycloakClient;

  @override
  onInit() async {
    await authService.init();

    savedEndpoint = (authService.getMirvEndpoint()).obs;
    savedKeycloakEndpoint = (authService.getKeycloakEndpoint()).obs;
    savedKeycloakRealm = (authService.getKeycloakRealm()).obs;
    savedKeycloakClient = (authService.getKeycloakClient()).obs;

    endpointController.value.text = 'http://20.106.14.47:8080';

    // savedEndpoint.value;
    keycloakEndpointController.value.text = savedKeycloakEndpoint.value;
    keycloakRealmController.value.text = savedKeycloakRealm.value;
    keycloakClientController.value.text = savedKeycloakClient.value;

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
  Rx<bool> compareOriginEndpoint = true.obs;
  Rx<bool> compareOriginKeycloakEndpoint = true.obs;
  Rx<bool> compareOriginKeycloakRealm = true.obs;
  Rx<bool> compareOriginKeycloakClient = true.obs;

  SettingsPage({Key? key}) : super(key: key);
  final settingsTextBoxController = Get.put(SettingsTextBoxController());

  AuthService authService = AuthService();

  final MirvApi mirvApi = MirvApi();

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
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: compareOrigin.value ? Colors.blue : Colors.red)),
          ),
        ),
      ),
      trailing: Obx(
        () => ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(compareOrigin.value ? Colors.grey : Colors.blue),
          ),
          onPressed: () {
            if (!compareOrigin.value) {
              controller.value.text = savedValue.value;
              compareOrigin.value = true;
            }
          },
          child: Text('Reset'),
        ),
      ),
    );
  }

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
              _textFieldtile(
                  controller: settingsTextBoxController.endpointController,
                  savedValue: settingsTextBoxController.savedEndpoint,
                  compareOrigin: compareOriginEndpoint,
                  labelText: 'MIRV Cloud Api'),
              // ListTile(
              //   title: Obx(
              //     () => TextField(
              //       controller: settingsTextBoxController.endpointController.value,
              //       onChanged: (text) {
              //         compareOriginEndpoint.value = settingsTextBoxController.savedEndpoint.value == text;
              //       },
              //       decoration: InputDecoration(
              //         labelText: 'MIRV Cloud Endpoint:',
              //         enabledBorder: UnderlineInputBorder(
              //             borderSide: BorderSide(color: compareOriginEndpoint.value ? Colors.blue : Colors.red)),
              //       ),
              //     ),
              //   ),
              //   trailing: Obx(
              //     () => ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(compareOriginEndpoint.value ? Colors.grey : Colors.blue),
              //         ),
              //         onPressed: () {
              //           compareOriginEndpoint.value
              //               ? null
              //               : settingsTextBoxController.endpointController.value.text = SettingsDefaults.endpoint;
              //         },
              //         child: Text('Reset')),
              //   ),
              // ),
              // ListTile(
              //   title: TextField(
              //     controller: settingsTextBoxController.keycloakEndpointController.value,
              //     decoration: InputDecoration(
              //       labelText: 'Keycloak Endpoint:',
              //       enabledBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(
              //               color: settingsTextBoxController.savedKeycloakEndpoint.value ==
              //                       settingsTextBoxController.keycloakEndpointController.value.text
              //                   ? Colors.blue
              //                   : Colors.red)),
              //     ),
              //     onChanged: (_) {
              //       compareOriginKeycloakEndpoint.value = true;
              //     },
              //   ),
              //   trailing: Obx(
              //     () => ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(compareOriginKeycloakEndpoint.value ? Colors.blue : Colors.grey),
              //         ),
              //         onPressed: () {
              //           compareOriginKeycloakEndpoint.value
              //               ? settingsTextBoxController.keycloakEndpointController.value.text = SettingsDefaults.keycloakEndpoint
              //               : null;
              //         },
              //         child: Text('Reset')),
              //   ),
              // ),
              // ListTile(
              //   title: TextField(
              //     controller: settingsTextBoxController.keycloakRealmController.value,
              //     decoration: InputDecoration(
              //       labelText: 'Keycloak Realm:',
              //       enabledBorder: UnderlineInputBorder(
              //           borderSide: BorderSide(
              //               color: settingsTextBoxController.savedKeycloakRealm.value ==
              //                       settingsTextBoxController.keycloakRealmController.value.text
              //                   ? Colors.blue
              //                   : Colors.red)),
              //     ),
              //     onChanged: (_) {
              //       compareOriginKeycloakRealm.value = true;
              //     },
              //   ),
              //   trailing: Obx(
              //     () => ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(compareOriginKeycloakRealm.value ? Colors.blue : Colors.grey),
              //         ),
              //         onPressed: () {
              //           compareOriginKeycloakRealm.value
              //               ? settingsTextBoxController.keycloakRealmController.value.text = SettingsDefaults.keycloakRealm
              //               : null;
              //         },
              //         child: Text('Reset')),
              //   ),
              // ),
              // ListTile(
              //   title: TextField(
              //     controller: settingsTextBoxController.keycloakClientController.value,
              //     decoration: InputDecoration(
              //       labelText: 'Keycloak Client:',
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(
              //             color: settingsTextBoxController.savedKeycloakClient.value ==
              //                     settingsTextBoxController.keycloakClientController.value.text
              //                 ? Colors.blue
              //                 : Colors.red),
              //       ),
              //     ),
              //     onChanged: (_) {
              //       settingsTextBoxController.savedKeycloakClient.value ==
              //               settingsTextBoxController.keycloakClientController.value.text
              //           ? compareOriginKeycloakClient.value = true
              //           : compareOriginKeycloakClient.value = false;
              //     },
              //   ),
              //   trailing: Obx(
              //     () => ElevatedButton(
              //         style: ButtonStyle(
              //           backgroundColor:
              //               MaterialStateProperty.all<Color>(compareOriginKeycloakClient.value ? Colors.blue : Colors.grey),
              //         ),
              //         onPressed: () {
              //           compareOriginKeycloakClient.value
              //               ? settingsTextBoxController.keycloakClientController.value.text = SettingsDefaults.keycloakClient
              //               : null;
              //         },
              //         child: Text('Reset')),
              //   ),
              // ),
              ElevatedButton(
                  onPressed: () async {
                    if (!await mirvApi.testEndpoint(settingsTextBoxController.endpointController.value.text)) {
                      Get.dialog(
                        AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text('Invalid Endpoint'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Okay'))
                          ],
                        ),
                      );
                    } else if (!await mirvApi.testEndpoint(settingsTextBoxController.keycloakEndpointController.value.text)) {
                      Get.dialog(
                        AlertDialog(
                          title: Text('Invalid Input'),
                          content: Text('Invalid Endpoint'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('Okay'))
                          ],
                        ),
                      );
                    } else {
                      authService.setMirvEndpoint(settingsTextBoxController.endpointController.value.text);
                      authService.setKeycloakEndpoint(settingsTextBoxController.keycloakEndpointController.value.text);

                      authService.setKeycloakRealm(settingsTextBoxController.keycloakRealmController.value.text);
                      authService.setKeycloakClient(settingsTextBoxController.keycloakClientController.value.text);
                      settingsTextBoxController.savedEndpoint.value = authService.getMirvEndpoint();
                      settingsTextBoxController.savedKeycloakEndpoint.value = authService.getKeycloakEndpoint();
                      settingsTextBoxController.savedKeycloakRealm.value = authService.getKeycloakRealm();
                      settingsTextBoxController.savedKeycloakClient.value = authService.getKeycloakClient();

                      compareOriginEndpoint.value = true;
                      compareOriginKeycloakEndpoint.value = true;
                      compareOriginKeycloakRealm.value = true;
                      compareOriginKeycloakClient.value = true;
                    }
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
