import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rts_web/utils/constants.dart';
import 'package:rts_web/widgets/custom_snackbar.dart';

import '../API/API.dart';

class AuthController extends GetxController {

  String _email = "";
  String _password = "";
  String _forgottenEmail = "";
  String _authUID = "";
  bool _passwordIsTooWeak = false;
  bool _emailAlreadyInUse = false;
  bool _signingUp = false;
  bool _signingIn = false;
  bool _emptyFields = false;
  bool _isOnSignUpMode = true;
  bool _sendingForgottenEmail = false;
  RxBool _isUserSignedIn = false.obs;

  get email => _email;
  get password => _password;
  get forgottenEmail => _forgottenEmail;
  get authUID => _authUID;
  get passwordIsTooWeak => _passwordIsTooWeak;
  get emailAlreadyInUse => _emailAlreadyInUse;
  get signingUp => _signingUp;
  get signingIn => _signingIn;
  get emptyFields => _emptyFields;
  get isOnSignUpMode => _isOnSignUpMode;
  get sendingForgottenEmail => _sendingForgottenEmail;
  get isUserSignedIn => _isUserSignedIn;

  var api = API();

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        _isUserSignedIn.value = false;
      } else {
        _isUserSignedIn.value = true;
        _authUID = user.uid;
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
    } else {//TODO: Try this
      // try {
      //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: _email,
      //     password: _password,
      //   ).then((value) {
      //     api.registerUser(_email, value.user!.uid);
      //     signInUser();
      //   });
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     _passwordIsTooWeak = true;
      //   } else if (e.code == 'email-already-in-use') {
      //     _emailAlreadyInUse = true;
      //   }
      // } catch (e) {
      //   print(e);
      // }
      await api.createFirebaseUser(_email, _password);
    }
    _signingUp = false;
    update();
  }

  void signInUser() async {
    _authUID = '';
    _signingIn = true;
    update();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password
      ).then((value) {
        _authUID = value.user!.uid;
        update();
        Get.toNamed(INVENTORY);
        createSnackbar('success', "Welcome to Timefront!");
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        createSnackbar('error', "Email and password provided do not match");
      } else {
        createSnackbar('error', e.message.toString());
      }
    }
    _signingIn = false;
    update();
  }

  void getUserDetails(String uid) async {
    api.getUserDetails(uid);
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
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