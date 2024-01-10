import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';
import 'package:rts_web/auth/auth_controller.dart';
import 'package:rts_web/NFTs/NFTModel.dart';

import '../API/API.dart';
import '../utils/utils.dart';

class InventoryController extends GetxController {

  final authController = Get.put(AuthController());
  final nftsController = Get.put(NFTsController());
  var api = API();
  List<NFTModel> displayList = [];
  bool _gettingAssets = false;

  get gettingAssets => _gettingAssets;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authController.isUserSignedIn.value) {
        getUserAssets();
      }
      super.onInit();
    });
  }

  void getUserAssets() async {
    displayList = [];
    _gettingAssets = true;
    update();
    var assets = await api.getUserAssets(authController.authUID);
    //TODO: Handle more than 1 page / 50 items
    var userAssets = json.decode(assets.body);
    if (userAssets['statusCode'] != 404) {
      List<NFTModel> nftList = nftsController.copyFrom(await nftsController.getNFTs());
      for (var asset in userAssets['data']) {
        bool found = false;
        int i = 0;
        while(i < nftList.length && !found) {
          if (nftList[i].name == asset['name']) {
            found = true;
            if (!displayList.contains(nftList[i])) {
              displayList.add(nftList[i]);
            }
            displayList[displayList.indexOf(nftList[i])].amount++;
          } else {
            i++;
          }
        }
      }
    }
    _gettingAssets = false;
    update();
  }
}