import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rts_web/utils/constants.dart';
import 'package:rts_web/widgets/custom_snackbar.dart';

class AuthController extends GetxController {

  String _email = "";
  String _password = "";
  String _forgottenEmail = "";
  bool _passwordIsTooWeak = false;
  bool _emailAlreadyInUse = false;
  bool _signingUp = false;
  bool _emptyFields = false;
  bool _isOnSignUpMode = true;
  bool _sendingForgottenEmail = false;

  get email => _email;
  get password => _password;
  get passwordIsTooWeak => _passwordIsTooWeak;
  get emailAlreadyInUse => _emailAlreadyInUse;
  get signingUp => _signingUp;
  get emptyFields => _emptyFields;
  get isOnSignUpMode => _isOnSignUpMode;
  get forgottenEmail => _forgottenEmail;
  get sendingForgottenEmail => _sendingForgottenEmail;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.onInit();
  }

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
          signInUser();
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

  void signInUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password
      ).then((value) {
        createSnackbar('success', "Signed in!");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        createSnackbar('error', "Email and password provided do not match");
      }
    }
  }

  void resetPassword() async {
    _sendingForgottenEmail = true;
    update();
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _forgottenEmail);
    _sendingForgottenEmail = false;
    update();
    createSnackbar('success', 'An email was sent to $_forgottenEmail!');
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

  void changeForgottenEmail(String email) {
    _forgottenEmail = email;
  }

}