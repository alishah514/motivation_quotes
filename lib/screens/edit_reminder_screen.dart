import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motivation_quotes/Services/notification_helper.dart';
import 'package:motivation_quotes/controllers/reminder_controller.dart';

import '../widgets/theme.dart';

class EditReminderScreen extends StatelessWidget {
  EditReminderScreen({Key? key}) : super(key: key);

  final ReminderController reminderController = Get.put(ReminderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Edit Reminder",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            print(reminderController.dateTime.value);
            NotificationService().scheduledNotification(
              hour: reminderController.dateTime.value.hour,
              minutes: reminderController.dateTime.value.minute,
              id: reminderController.notiid.value,
              quote: reminderController.desc.value,
            );
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Type of quotes",
                  style: subTitleTextStle,
                ),
                Text(
                  "General",
                  style: bodyTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            HowMany(reminderController: reminderController),
            SizedBox(
              height: 90,
            ),
            Obx(() {
              return reminderController.howMany.value == 1
                  ? MyTime(reminderController: reminderController)
                  : Column(
                      children: [
                        StartTime(reminderController: reminderController),
                        SizedBox(
                          height: 20,
                        ),
                        EndsTime(reminderController: reminderController),
                      ],
                    );
            }),
            SizedBox(
              height: 90,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sound",
                    style: subTitleTextStle,
                  ),
                  Text(
                    "Positive",
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTime extends StatelessWidget {
  const MyTime({
    Key? key,
    required this.reminderController,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Time",
          style: subTitleTextStle,
        ),
        Row(
          children: [
            IncDecBtn(
              iconData: Icons.remove,
              onTap: () {
                reminderController.decTime();
              },
            ),
            SizedBox(
              width: 30,
            ),
            Obx(() {
              return Text(
                "${DateFormat('kk:mm').format(reminderController.dateTime.value)}",
                style: bodyTextStyle,
              );
            }),
            SizedBox(
              width: 30,
            ),
            IncDecBtn(
              iconData: Icons.add,
              onTap: () {
                reminderController.IncTime();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class EndsTime extends StatelessWidget {
  const EndsTime({
    Key? key,
    required this.reminderController,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Ends At",
          style: subTitleTextStle,
        ),
        Row(
          children: [
            IncDecBtn(
              iconData: Icons.remove,
              onTap: () {
                reminderController.endTimeInterval();
              },
            ),
            SizedBox(
              width: 30,
            ),
            Obx(() {
              return Text(
                "${DateFormat('kk:mm').format(reminderController.endTime.value)}X",
                style: bodyTextStyle,
              );
            }),
            SizedBox(
              width: 30,
            ),
            IncDecBtn(
              iconData: Icons.add,
              onTap: () {
                reminderController.endTimeremoveInterval();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class StartTime extends StatelessWidget {
  const StartTime({
    Key? key,
    required this.reminderController,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Starts At",
          style: subTitleTextStle,
        ),
        Row(
          children: [
            IncDecBtn(
              iconData: Icons.remove,
              onTap: () {
                reminderController.startTimeInterval();
              },
            ),
            SizedBox(
              width: 30,
            ),
            Obx(() {
              return Text(
                "${DateFormat('kk:mm').format(reminderController.startTime.value)}X",
                style: bodyTextStyle,
              );
            }),
            SizedBox(
              width: 30,
            ),
            IncDecBtn(
              iconData: Icons.add,
              onTap: () {
                reminderController.startTimeremoveInterval();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class HowMany extends StatelessWidget {
  const HowMany({
    Key? key,
    required this.reminderController,
  }) : super(key: key);

  final ReminderController reminderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "How Many",
          style: subTitleTextStle,
        ),
        Row(
          children: [
            IncDecBtn(
              iconData: Icons.remove,
              onTap: () {
                reminderController.decrement();
              },
            ),
            SizedBox(
              width: 30,
            ),
            Obx(() {
              return Text(
                "${reminderController.howMany.value}X",
                style: bodyTextStyle,
              );
            }),
            SizedBox(
              width: 30,
            ),
            IncDecBtn(
              iconData: Icons.add,
              onTap: () {
                reminderController.increment();
              },
            ),
          ],
        ),
      ],
    );
  }
}

class IncDecBtn extends StatelessWidget {
  const IncDecBtn({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Get.isDarkMode ? white : Colors.black, width: 0.8)),
        child: Center(
          child: Icon(
            iconData,
            color: context.theme.iconTheme.color,
            size: 25,
          ),
        ),
      ),
    );
  }
}
