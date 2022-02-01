import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:student_app/models/notification.dart';

class Notifications with ChangeNotifier {
  List<Notification> _notifications = [];
  List<Notification> get newNotifications {
    return [..._notifications];
  }

  Future<void> fetchAndSetNotifications() async {
    var url =
        'https://depatment-management-system.herokuapp.com/api/v1/dmi/students/auth/notifications';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    var data = json.decode(response.body);
    List<Notification> loadedNotifications = [];
    print(data['newNotifications']);
    data['newNotifications'].forEach(
      (notification) => {
        loadedNotifications.add(
          Notification(
            date: notification['Data'],
            id: notification['id'],
            title: notification['title'],
            message: notification['body'],
          ),
        ),
      },
    );
    _notifications = loadedNotifications;
    notifyListeners();
  }
}
