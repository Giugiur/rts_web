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
        _NFTsList.add(buildNFTModel(item));
      }
    }
    update();
    return _NFTsList;
  }

  NFTModel buildNFTModel(dynamic item) {
    return NFTModel(
      id: item['data']['id'] ?? '1',
      name: item['id'] ?? 'Placeholder',
      imageUrl: item['data']['imageUrl'] ?? '',
      rarity: item['data']['rarity'] != null ? convertToRarity(item['data']['rarity']) : Rarity.Common,
      type: item['data']['type'] != null ? convertToType(item['data']['type']) : Type.Unit,
      race: item['data']['race'] != null ? convertToRace(item['data']['race']) : Race.Eldmen,
    );
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

  Type convertToType(String type) {
    Type ret = Type.Unit;
    switch (type) {
      case 'Unit':
        ret = Type.Unit;
        break;
      case 'Hero':
        ret = Type.Hero;
        break;
      default:
        ret = Type.Unit;
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
        ret = Race.Gorks;
        break;
      case 'Keenfolk':
        ret = Race.Keenfolk;
        break;
      case 'Velhan':
        ret = Race.Velhan;
        break;
      default:
        ret = Race.Eldmen;
    }
    return ret;
  }


}
