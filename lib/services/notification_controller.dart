import 'dart:async';

import 'package:get/get.dart';
import 'package:mirv/models/pair.dart';

class NotificationController {
  DateTime? lastNotificationTime;
  Pair<String, String>? queuedNotification;
  Timer? timer;

  NotificationController() {
    startNotifications();
  }

  queueNotification(String title, String message) {
    queuedNotification = Pair(title, message);
  }

  sendNotification(Pair<String, String> text) {
    Get.snackbar(text.first, text.last);
    lastNotificationTime = DateTime.now();
    queuedNotification = null;
  }

  startNotifications() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (queuedNotification == null) return;
      Pair<String, String> message = queuedNotification!;

      if (lastNotificationTime == null) {
        sendNotification(message);
      } else if (DateTime.now().difference(lastNotificationTime!).inSeconds.abs() > 5) {
        sendNotification(message);
      } else {
        // Do nothing, too soon
      }
    });
  }
}
