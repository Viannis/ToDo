import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    'your channel description',
    importance: Importance.Max,
    priority: Priority.High,
    ongoing: true,
    autoCancel: false,
  );
  final iOSChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
}

Future showOngoingNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,{
  @required String title,
  @required String body,
  int id = 0,
}) => _showNotification(flutterLocalNotificationsPlugin,title: title,body:body,id:id,type:_ongoing);

Future _showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,{
  @required String title,
  @required String body,
  @required NotificationDetails type,
  int id = 0,
}) => flutterLocalNotificationsPlugin.show(id, title, body, type);