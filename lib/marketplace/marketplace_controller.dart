import 'package:get/get.dart';
import 'marketplace_listing_model.dart';

class MarketplaceController extends GetxController {

  List<MarketplaceListing> initialList = [];
  RxList _displayList = [].obs;

  get displayList => _displayList;

  @override
  void onInit() {

    initialList = initList();
    displayList.value = RxList.from(initialList);
    super.onInit();
  }

  List<MarketplaceListing> initList() {
    return [
      MarketplaceListing(
        id: '0', name: 'Quintus, The Ironbull',
        imageUrl: 'https://i.imgur.com/FfE62PM.png',
        rarity: Rarity.Rare,
      ),
      MarketplaceListing(
        id: '1',
        name: 'Legionaire',
        imageUrl: 'https://i.imgur.com/gWrm7pF.png',
        rarity: Rarity.Common,
      ),
      MarketplaceListing(
        id: '2',
        name: 'Lightbearer',
        imageUrl: 'https://i.imgur.com/FpNPHFD.png',
        rarity: Rarity.Uncommon,
      ),
      MarketplaceListing(
        id: '3',
        name: 'Selzedwyn, Royal Assassin',
        imageUrl: 'https://i.imgur.com/E8QChK4.png',
        rarity: Rarity.Rare,
      ),
      MarketplaceListing(
        id: '4',
        name: 'Forestborn',
        imageUrl: 'https://i.imgur.com/wuXeXZX.png',
        rarity: Rarity.Common,
      ),
      MarketplaceListing(
        id: '5',
        name: 'Treeguard',
        imageUrl: 'https://i.imgur.com/h5QUIHe.png',
        rarity: Rarity.Uncommon,
      ),
      MarketplaceListing(
        id: '6',
        name: 'Ukbar, Crowned Prince',
        imageUrl: 'https://i.imgur.com/YgvASXT.png',
        rarity: Rarity.Rare,
      ),
      MarketplaceListing(
        id: '7',
        name: 'Gunner',
        imageUrl: 'https://i.imgur.com/QRHQ2kM.png',
        rarity: Rarity.Common,
      ),
      MarketplaceListing(
        id: '8',
        name: 'Tinman',
        imageUrl: 'https://i.imgur.com/4Lp8gIz.png',
        rarity: Rarity.Uncommon,
      ),
    ];
  }

  void updateFilter(String filter, value) {

  }
}