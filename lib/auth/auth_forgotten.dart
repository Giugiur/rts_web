import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'auth_controller.dart';
import '../home/home_scaffold.dart';
import '../utils/constants.dart';

class AuthForgotten extends StatelessWidget {
  const AuthForgotten({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (authController) => HomeScaffold(
        body: Center(
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
                      'Forgotten Password?',
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
                  onChanged: (value) => authController.changeForgottenEmail(value),
                ),
                const SizedBox(height: 20),
                authController.sendingForgottenEmail ? Center(child: const CircularProgressIndicator()) : OutlinedButton(
                  onPressed: () => authController.resetPassword(),
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
                  child: Text('Send Email'),
                ),
              ]
            ),
          ),
        )
      )
    );
  }
}
