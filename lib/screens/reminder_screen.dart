import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/theme.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Reminder",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // print(reminderController.dateTime.value);
            // NotificationService().scheduledNotification(
            //   hour: reminderController.dateTime.value.hour,
            //   minutes: reminderController.dateTime.value.minute,
            //   id: reminderController.notiid.value,
            //   quote: reminderController.desc.value,
            // );
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Text(
              "SET UP YOUR DAILY ROUTINE",
              style: bodyTextStyle,
            ),
            SizedBox(
              height: 60,
            ),
            Card(
              elevation: 15.0,
              shadowColor: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: lightGreyClr,
                    ),
                    height: 55,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class MyCustomContainer extends StatelessWidget {
//   final Color backgroundColor;
//   final Color progressColor;
//   final double progress;
//   final double size;

//   const MyCustomContainer({
//     Key? key,
//     this.backgroundColor = Colors.grey,
//     this.progressColor = Colors.red,
//     required this.progress,
//     required this.size,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size,
//       width: double.infinity,
//       child: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: backgroundColor,
//                 borderRadius: BorderRadius.circular(20)),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: size * progress,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: progressColor,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(20),
//                       bottomRight: Radius.circular(20))),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
