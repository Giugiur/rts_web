import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_scaffold.dart';
import 'package:rts_web/utils/constants.dart';
import 'package:rts_web/widgets/custom_loading_indicator.dart';
import 'package:rts_web/widgets/hero_button.dart';
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
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Row(
          children: [
            isSmallScreen(context) ? Container() : Expanded(
              flex: 50,
              child: SizedBox(
                width: deviceSize.width,
                height: deviceSize.height,
                child: Image.asset(
                  'images/auth_promo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              flex: 50,
              child: Container(
                decoration: gradientDecoration,
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
                              'Do you want to be kept up to date?',
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
                        authController.isOnSignUpMode ?
                        Text(
                          authController.errorMessage,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          )
                        ) :
                        SizedBox(
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () => Get.toNamed(FORGOTTEN),
                              child: Text(
                                'Forgot Password?',
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            )
                          ),
                        ),
                        const SizedBox(height: 40),
                        authController.signingUp || authController.signingIn? const CustomLoadingIndicator() :
                          HeroButton(
                            label: authController.isOnSignUpMode ? 'Sign Up' : 'Sign In',
                            onTap: authController.isOnSignUpMode ? authController.createUser : authController.signInUser,
                            width: double.infinity,
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
      ),
    )
    );
  }
}
