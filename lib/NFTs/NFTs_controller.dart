import 'package:get/get.dart';
import 'package:rts_web/API/API.dart';

import 'NFTModel.dart';

class NFTsController extends GetxController {

  List<NFTModel> _NFTsList = [];
  List<NFTModel> get NFTList => _NFTsList;

  void onInit() {
    super.onInit();
  }

  Future<List<NFTModel>> getNFTs() async {
    if (_NFTsList.isEmpty) {
      List<dynamic> response = await API().getNFTs();
      for (var item in response) {
        _NFTsList.add(await buildNFTModel(item));
      }
      update();
    }
    return _NFTsList;
  }

  NFTModel buildNFTModel(dynamic item)  {
    return NFTModel(
      id: item['data']['id'] ?? 'No ID',
      name: item['id'] ?? 'No Name',
      imageUrl: item['data']['imageUrl'] ?? '',
      rarity: item['data']['rarity'] != null ? convertToRarity(item['data']['rarity']) : Rarity.Common,
      classs: item['data']['class'] != null ? convertToType(item['data']['class']) : Classs.Unit,
      race: item['data']['race'] != null ? convertToRace(item['data']['race']) : Race.Eldmen,
      category: item['data']['category'] ?? 'No category',
      description: item['data']['description'] ?? 'No description',
      flavorText: item['data']['flavorText'] ?? 'No flavor text',
      usdPrice: item['data']['usdPrice'] ?? 0,
      totalSupply: item['data']['totalSupply'] ?? '0',
      guardValue: item['data']['guardValue'] ?? 0,
      armorType: item['data']['armorType'] ?? 'No armor type',
      attackType: item['data']['attackType'] ?? 'No attack type',
      passives: item['data']['passives'] != null ? buildPassives(item['data']['passives']): [],
      bonuses: item['data']['bonuses'] ?? [],
    );
  }

  List<dynamic> buildPassives (List<dynamic> passives) {
    List<dynamic> ret = [];
    for (var passive in passives) {
      ret.add({
      'name': passive,
      'description': '',
      });
    }
    return ret;
  }

  Rarity convertToRarity(String rarity) {
    Rarity ret = Rarity.Common;
    switch (rarity) {
      case 'Common':
        ret = Rarity.Common;
        break;
      case 'Uncommon':
        ret = Rarity.Uncommon;
        break;
      case 'Rare':
        ret = Rarity.Rare;
        break;
      case 'Mythic':
        ret = Rarity.Mythic;
        break;
      case 'Fabled':
        ret = Rarity.Fabled;
        break;
      default:
        ret = Rarity.Common;
    }
    return ret;
  }

  Classs convertToType(String classs) {
    Classs ret = Classs.Unit;
    switch (classs) {
      case 'Unit':
        ret = Classs.Unit;
        break;
      case 'Hero':
        ret = Classs.Hero;
        break;
      case 'Doctrine':
        ret = Classs.Doctrine;
        break;
      case 'Technology':
        ret = Classs.Technology;
        break;
      case 'Item':
        ret = Classs.Artifact;
        break;
      case 'Pack':
        ret = Classs.Pack;
        break;
      default:
        ret = Classs.Unit;
    }
    return ret;
  }

  Race convertToRace(String race) {
    Race ret = Race.Eldmen;
    switch (race) {
      case 'Eldmen':
        ret = Race.Eldmen;
        break;
      case 'Groll':
        ret = Race.Grolls;
        break;
      case 'Keenfolk':
        ret = Race.Keenfolk;
        break;
      case 'Keldarin':
        ret = Race.Keldarin;
        break;
      default:
        ret = Race.Eldmen;
    }
    return ret;
  }


}
