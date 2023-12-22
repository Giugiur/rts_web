import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/home/home_scaffold.dart';

import '../auth/auth_controller.dart';
import '../utils/utils.dart';
import 'inventory_controller.dart';
import 'inventory_grid.dart';

class InventoryView extends StatelessWidget {
  InventoryView({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: InventoryController(),
      builder: (inventoryController) => HomeScaffold(
        body: Obx(() =>
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    'Your Inventory',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  flex: 90,
                  child: authController.isUserSignedIn.value ?
                  InventoryGrid() :
                  const Center(
                    child: Text('You must be signed in to see your inventory.'),
                  ),
                ),

              ],
            )

          ),
        )
      ),
    );
  }
}
