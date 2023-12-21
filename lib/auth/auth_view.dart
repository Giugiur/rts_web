import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_scaffold.dart';
import 'package:rts_web/utils/constants.dart';
import 'auth_controller.dart';
import '../utils/utils.dart';
import '../utils/constants.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<AuthController>(
      init: AuthController(),
    builder: (authController) => HomeScaffold(
      body: Row(
        children: [
          Expanded(
            flex: isSmallScreen(context) ? 0 : 50,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              child: Center(
                child: SizedBox(
                  width: FORM_WIDTH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Welcome to Timefront',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        onChanged: (value) => authController.changeEmail(value),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (value) => authController.changePassword(value),
                      ),
                      authController.isOnSignUpMode ? const SizedBox(height: 20,) :
                      SizedBox(
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () => Get.toNamed(FORGOTTEN),
                            child: Text(
                              authController.isOnSignUpMode ? '' : 'Forgot Password?',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          )
                        ),
                      ),
                      authController.passwordIsTooWeak ? Text(
                        'Password is too weak',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        )
                      ) : Container(),
                      authController.emailAlreadyInUse ? Text(
                        'Email already in use',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ) : Container(),
                      authController.emptyFields ? Text(
                        'Field/s must not be empty',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ) : Container(),
                      authController.signingUp ? Center(child: const CircularProgressIndicator()) : OutlinedButton(
                        onPressed: () => authController.isOnSignUpMode ? authController.createUser() : authController.signInUser(),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(20)
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                        child: Text(authController.isOnSignUpMode ? 'Sign Up' : 'Sign In'),
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authController.isOnSignUpMode ? 'Already have an account?' : "Don't have an account?",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextButton(
                                onPressed: () => authController.changeMode(),
                                child: Text(
                                  authController.isOnSignUpMode ? 'Sign In' : 'Sign Up',
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
