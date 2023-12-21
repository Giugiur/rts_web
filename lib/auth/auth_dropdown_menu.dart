import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'auth_controller.dart';

enum MenuItem {
  Inventory,
  Logout,
}

class AuthDropdownMenu extends StatelessWidget {
  AuthDropdownMenu({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      icon: const Icon(
        Icons.person_4_sharp,
        size: 28,
      ),
      onSelected: (MenuItem selected) {
        switch (selected) {
          case MenuItem.Inventory:
            Get.toNamed(INVENTORY);
            break;
          case MenuItem.Logout:
            authController.signOut();
            Get.toNamed(HOME);
            break;
          default:
            print('default');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        const PopupMenuItem<MenuItem>(
          value: MenuItem.Inventory,
          child: Row(
            children: [
              Icon(
                Icons.wallet,
                size: 24,
              ),
              SizedBox(width: 10,),
              Text('Inventory'),
            ],
          ),
        ),
        const PopupMenuItem<MenuItem>(
          value: MenuItem.Logout,
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 24,
              ),
              SizedBox(width: 10,),
              Text('Sign Out      '),
            ],
          ),
        ),
      ],
    );
  }
}
