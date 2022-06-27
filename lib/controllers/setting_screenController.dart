import 'package:get/get.dart';

class SettingsController extends GetxController {
  final RxList selectedIndexes = [].obs;
  final RxList<String> wordName = [
    "Engaged in my Life",
    "Feel Alive",
    "Happy",
    "Love my Life",
  ].obs;

  var isChecked = false.obs;
  var isSelected = [].obs;
  var isSelectedUpdate = [].obs;

  void selectContainer({int? index, String? text, List? widgets}) {
    if (isSelected.length > 0 && isSelected.contains(text)) {
      isSelected.removeAt(0);
    } else if (isSelected.length > 0 && !isSelected.contains(text)) {
      isSelected.removeAt(0);
      isSelected.add(text);
    } else if (isSelected.length <= 0) {
      isSelected.add(text);
    }
  }

 void selectWidgetContainer({int? index, String? text, List? widgets}) {
    if (isSelectedUpdate.length > 0 && isSelectedUpdate.contains(text)) {
      isSelectedUpdate.removeAt(0);
    } else if (isSelectedUpdate.length > 0 && !isSelectedUpdate.contains(text)) {
      isSelectedUpdate.removeAt(0);
      isSelectedUpdate.add(text);
    } else if (isSelectedUpdate.length <= 0) {
      isSelectedUpdate.add(text);
    }
  }
}
