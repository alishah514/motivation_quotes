import 'package:get/get.dart';

import '../Services/firestore_services.dart';
import '../models/category.dart';

class CategoryController extends GetxController {
  Rx<List<Category>> catList = Rx<List<Category>>([]);
  List<Category> get categories => catList.value;

  @override
  void onReady() {
    catList.bindStream(FirestoreDb.catStream());
  }
}
