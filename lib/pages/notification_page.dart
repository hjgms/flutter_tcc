import 'package:flutter/material.dart';
import 'package:flutter_application_firebase/components/notification_item.dart';

//global
import 'package:flutter_application_firebase/global/variables.dart' as global;

class NotificationPage extends StatefulWidget {
  final List notificationList;
  
  const NotificationPage({
    super.key,
    required this.notificationList
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: global.colorTheme["mainPurple"] as Color,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: global.colorTheme["color5"] as Color
          ),
        ),
        title: const Text("Notifícations"),
        centerTitle: true,
      ),
      body: createListNotifications(widget.notificationList)
    );
  }

  Widget createListNotifications(List notif){
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 60,                    
      ),
      itemCount: notif.length,
      itemBuilder: (context, index) {
        return NotificationItem(
          providerName: notif[index]["nameProvider"],
          description: notif[index]["description"],
          uid: notif[index]["uidUser"]
        );
      },
    );
  }
}
