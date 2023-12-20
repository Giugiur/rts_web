import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rts_web/utils/constants.dart';

class AuthController extends GetxController {

  String _email = "";
  String _password = "";
  bool _passwordIsTooWeak = false;
  bool _emailAlreadyInUse = false;
  bool _signingUp = false;
  bool _emptyFields = false;
  bool _isOnSignUpMode = true;

  get email => _email;
  get password => _password;
  get passwordIsTooWeak => _passwordIsTooWeak;
  get emailAlreadyInUse => _emailAlreadyInUse;
  get signingUp => _signingUp;
  get emptyFields => _emptyFields;
  get isOnSignUpMode => _isOnSignUpMode;

  void createUser() async {
    _signingUp = true;
    _passwordIsTooWeak = false;
    _emailAlreadyInUse = false;
    _emptyFields = false;
    update();
    if (_email == "" || _password == "") {
      _emptyFields = true;
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        ).then((value) {
          signInUser(value);
          redirectTo(MARKETPLACE);
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _passwordIsTooWeak = true;
        } else if (e.code == 'email-already-in-use') {
          _emailAlreadyInUse = true;
        }
      } catch (e) {
        print(e);
      }
    }
    _signingUp = false;
    update();
  }

  void signInUser(value) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void changeMode() {
    _isOnSignUpMode = !_isOnSignUpMode;
    update();
  }

  void redirectTo(String name) {
    Get.toNamed(name);
  }

  void changeEmail(String email) {
    _email = email;
  }

  void changePassword(String password) {
    _password = password;
  }

}