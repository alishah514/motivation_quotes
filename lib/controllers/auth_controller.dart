import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motivation_quotes/Services/firestore_services.dart';
import 'package:motivation_quotes/controllers/user_controller.dart';
import 'package:motivation_quotes/screens/quotes_screen.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _User = Rxn<User>();

  User? get user => _User.value;

  @override
  void onInit() {
    _User.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser() async {
    try {
      UserCredential _authResult = await _auth.signInAnonymously();
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: "name",
      );
      if (await FirestoreDb().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
      }
      Get.offAll(QuotesScreen());
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
