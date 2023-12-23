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
      update();
    }
    return _NFTsList;
  }

  NFTModel buildNFTModel(dynamic item) {
    return NFTModel(
      id: item['data']['id'] ?? '1',
      name: item['id'] ?? 'Placeholder',
      imageUrl: item['data']['imageUrl'] ?? '',
      rarity: item['data']['rarity'] != null ? convertToRarity(item['data']['rarity']) : Rarity.Common,
      classs: item['data']['class'] != null ? convertToType(item['data']['class']) : Classs.Unit,
      race: item['data']['race'] != null ? convertToRace(item['data']['race']) : Race.Eldmen,
      category: item['data']['category'] ?? 'Not defined',
      description: item['data']['description'] ?? 'Not defined',
      flavorText: item['data']['flavorText'] ?? 'Not defined',
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

  Classs convertToType(String classs) {
    Classs ret = Classs.Unit;
    switch (classs) {
      case 'Unit':
        ret = Classs.Unit;
        break;
      case 'Hero':
        ret = Classs.Hero;
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
