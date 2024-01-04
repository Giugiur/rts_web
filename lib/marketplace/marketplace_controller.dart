import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';
import '../NFTs/NFTs_item.dart';
import '../NFTs/NFTModel.dart';

class MarketplaceController extends GetxController {

  NFTsController nftsController = Get.put(NFTsController());
  RxList displayList = [].obs;
  bool _isReady = false;

  get isReady => _isReady;
  get filterObj => _filterObj;

  //ToDo: Delete this when testing is over
  // List<NFTModel> initList() {
  //   return [
  //     NFTModel(
  //       id: '0', name: 'Quintus, Legion Commander',
  //       imageUrl: 'https://i.imgur.com/FfE62PM.png',
  //       rarity: Rarity.Rare,
  //       race: Race.Eldmen,
  //       type: Type.Hero,
  //     ),
  //     NFTModel(
  //       id: '1',
  //       name: 'Imperial Legionaire',
  //       imageUrl: 'https://i.imgur.com/gWrm7pF.png',
  //       rarity: Rarity.Common,
  //       race: Race.Eldmen,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '2',
  //       name: 'Lightbearer',
  //       imageUrl: 'https://i.imgur.com/FpNPHFD.png',
  //       rarity: Rarity.Mythic,
  //       race: Race.Eldmen,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '3',
  //       name: 'Selzedwyn, Royal Assassin',
  //       imageUrl: 'https://i.imgur.com/E8QChK4.png',
  //       rarity: Rarity.Fabled,
  //       race: Race.Keenfolk,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '4',
  //       name: 'Forestborn',
  //       imageUrl: 'https://i.imgur.com/wuXeXZX.png',
  //       rarity: Rarity.Common,
  //       race: Race.Keldarin,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '5',
  //       name: 'Treewarden',
  //       imageUrl: 'https://i.imgur.com/h5QUIHe.png',
  //       rarity: Rarity.Uncommon,
  //       race: Race.Keldarin,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '6',
  //       name: 'Ukbar, Crowned Prince',
  //       imageUrl: 'https://i.imgur.com/YgvASXT.png',
  //       rarity: Rarity.Rare,
  //       race: Race.Keenfolk,
  //       type: Type.Hero,
  //     ),
  //     NFTModel(
  //       id: '7',
  //       name: 'Gunner',
  //       imageUrl: 'https://i.imgur.com/QRHQ2kM.png',
  //       rarity: Rarity.Common,
  //       race: Race.Keenfolk,
  //       type: Type.Unit,
  //     ),
  //     NFTModel(
  //       id: '8',
  //       name: 'Tinman',
  //       imageUrl: 'https://i.imgur.com/4Lp8gIz.png',
  //       rarity: Rarity.Uncommon,
  //       race: Race.Keenfolk,
  //       type: Type.Unit,
  //     ),
  //   ];
  // }
  final RxMap<dynamic, dynamic> _initFilterObj = {
    'searchFilter': '',
    Race.Eldmen: true,
    Race.Keenfolk: true,
    Race.Keldarin: true,
    Race.Grolls: true,
    Race.Travelers: true,
    Rarity.Common: true,
    Rarity.Uncommon: true,
    Rarity.Rare: true,
    Rarity.Mythic: true,
    Rarity.Fabled: true,
    Classs.Hero: true,
    Classs.Unit: true,
    Classs.Artifact: true,
    Classs.Doctrine: true,
    Classs.Technology: true,
    Classs.Skin: true,
    Classs.Pass: true,
    Classs.Pack: true,
  }.obs;
  final RxMap<dynamic, dynamic> _filterObj = RxMap<dynamic, dynamic>();

  @override
  void onInit() async {
    await clearFilters();
    _isReady = true;
    super.onInit();
  }

  Future<void> clearFilters() async {
    _filterObj.value = RxMap<dynamic, dynamic>.from(_initFilterObj);
    await runFilters();
  }

  void updateFilter(dynamic filter, dynamic newValue) async {
    _filterObj[filter] = newValue;
    await runFilters();
  }

  Future<void> runFilters() async {
    displayList.value = [];
    displayList.value = RxList.from(await nftsController.getNFTs());
    displayList.removeWhere((nftModel) {
      if (_filterObj['searchFilter'] != '') {
        if (!nftModel.name.toLowerCase().contains(_filterObj['searchFilter'].toLowerCase())) {
          return true;
        }
      }

      for(dynamic filter in _filterObj.keys) {
        if (filter is Race) {
          if (!_filterObj[filter] && filter == nftModel.race) {
            return true;
          }
        }
        if (filter is Rarity) {
          if (!_filterObj[filter] && filter == nftModel.rarity) {
            return true;
          }
        }
        if (filter is Classs) {
          if (!_filterObj[filter] && filter == nftModel.classs) {
            return true;
          }
        }
      }
      update();

      return false;
    });
  }
}