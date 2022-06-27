import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motivation_quotes/controllers/quotes_controller.dart';

class ReminderController extends GetxController {
  @override
  void onReady() {
    notifid();
    fetchQuote();
    super.onReady();
  }

  var howMany = 1.obs;
  Rx<DateTime> dateTime = DateTime.now().obs;
  Rx<DateTime> startTime = DateTime.now().obs;
  Rx<DateTime> endTime = DateTime.now().obs;

  var notiid = 0.obs;
  var desc = ''.obs;

  increment() {
    if (howMany.value != 30) {
      howMany.value++;
    } else {
      null;
    }
  }

  decrement() {
    if (howMany.value != 1) {
      howMany.value--;
    } else {
      null;
    }
  }

  IncTime() {
    var date = dateTime.value.add(Duration(minutes: 1));
    dateTime.value = date;
    return dateTime.value;
  }

  decTime() {
    var date = dateTime.value.subtract(Duration(minutes: 1));
    dateTime.value = date;
    return dateTime.value;
  }


  startTimeInterval() {
    var date = startTime.value.add(Duration(minutes: 1));
    startTime.value = date;
    return startTime.value;
  }

  endTimeInterval() {
    var date = endTime.value.add(Duration(minutes: 1));
    endTime.value = date;
    return endTime.value;
  }

  startTimeremoveInterval() {
    var date = startTime.value.subtract(Duration(minutes: 1));
    startTime.value = date;
    return startTime.value;
  }

  endTimeremoveInterval() {
    var date = endTime.value.subtract(Duration(minutes: 1));
    endTime.value = date;
    return endTime.value;
  }

  notifid() {
    // Get.find<QuotesController>().quotes.forEach((element) {

    // });
    notiid.value = dateTime.value.second;
    print(notiid.value);
    return notiid.value;
  }

  fetchQuote() {
    Get.find<QuotesController>().quotes.forEach((element) {
      if (element.quote != null) {
        desc.value = element.quote!;
      } else {
        desc.value = 'Hello! Motivation App Here!';
      }
    });
    print(desc.value);
    return desc.value;
  }
}
