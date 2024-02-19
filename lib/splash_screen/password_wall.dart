import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_scaffold.dart';
import 'package:rts_web/splash_screen/password_wall_controller.dart';

import '../utils/utils.dart';

class PasswordWall extends StatelessWidget {
  const PasswordWall({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return GetBuilder<PasswordWallController>(
      init: PasswordWallController(),
      builder: (passwordWallController) =>
        HomeScaffold(
          body: Center(
            child: SizedBox(
              width: 500,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                onChanged: (value) => passwordWallController.updatePassword(value),
              ),
            )
          )
        )
    );
  }
}
