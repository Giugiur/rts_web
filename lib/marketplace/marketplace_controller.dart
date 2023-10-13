import 'package:get/get.dart';
import 'marketplace_listing_model.dart';

class MarketplaceController extends GetxController {

  RxList displayList = [].obs;

  //ToDo: Delete this when testing is over
  List<MarketplaceListing> initList() {
    return [
      MarketplaceListing(
        id: '0', name: 'Quintus, The Ironbull',
        imageUrl: 'https://i.imgur.com/FfE62PM.png',
        rarity: Rarity.Rare,
        race: Race.Eldmen,
      ),
      MarketplaceListing(
        id: '1',
        name: 'Legionaire',
        imageUrl: 'https://i.imgur.com/gWrm7pF.png',
        rarity: Rarity.Common,
        race: Race.Eldmen,
      ),
      MarketplaceListing(
        id: '2',
        name: 'Lightbearer',
        imageUrl: 'https://i.imgur.com/FpNPHFD.png',
        rarity: Rarity.Uncommon,
        race: Race.Eldmen,
      ),
      MarketplaceListing(
        id: '3',
        name: 'Selzedwyn, Royal Assassin',
        imageUrl: 'https://i.imgur.com/E8QChK4.png',
        rarity: Rarity.Rare,
        race: Race.Velhan,
      ),
      MarketplaceListing(
        id: '4',
        name: 'Forestborn',
        imageUrl: 'https://i.imgur.com/wuXeXZX.png',
        rarity: Rarity.Common,
        race: Race.Velhan,
      ),
      MarketplaceListing(
        id: '5',
        name: 'Treeguard',
        imageUrl: 'https://i.imgur.com/h5QUIHe.png',
        rarity: Rarity.Uncommon,
        race: Race.Velhan,
      ),
      MarketplaceListing(
        id: '6',
        name: 'Ukbar, Crowned Prince',
        imageUrl: 'https://i.imgur.com/YgvASXT.png',
        rarity: Rarity.Rare,
        race: Race.Keenfolk,
      ),
      MarketplaceListing(
        id: '7',
        name: 'Gunner',
        imageUrl: 'https://i.imgur.com/QRHQ2kM.png',
        rarity: Rarity.Common,
        race: Race.Keenfolk,
      ),
      MarketplaceListing(
        id: '8',
        name: 'Tinman',
        imageUrl: 'https://i.imgur.com/4Lp8gIz.png',
        rarity: Rarity.Uncommon,
        race: Race.Keenfolk,
      ),
    ];
  }
  final RxMap<dynamic, dynamic> _initFilterObj = {
    'searchFilter': '',
    Race.Eldmen: true,
    Race.Keenfolk: true,
    Race.Velhan: true,
    Race.Gorks: true,
    Race.Shadowlings: true,
    Rarity.Common: true,
    Rarity.Uncommon: true,
    Rarity.Rare: true,
    Rarity.Mythic: true,
    Rarity.Fabled: true,
  }.obs;
  final RxMap<dynamic, dynamic> _filterObj = RxMap<dynamic, dynamic>();

  get filterObj => _filterObj;

  @override
  void onInit() {
    displayList.value = RxList.from(initList());
    clearFilters();
    super.onInit();
  }

  void clearFilters() {
    _filterObj.value = RxMap<dynamic, dynamic>.from(_initFilterObj);
    runFilters();
  }

  void updateFilter(dynamic filter, dynamic newValue) {
    _filterObj[filter] = newValue;
    runFilters();
  }

  void runFilters() {
    displayList.value = RxList.from(initList());
    displayList.removeWhere((marketplaceListing) {
      if (_filterObj['searchFilter'] != '') {
        if (!marketplaceListing.name.toLowerCase().contains(_filterObj['searchFilter'].toLowerCase())) {
          return true;
        }
      }
      switch (marketplaceListing.race) {
        case Race.Eldmen:
          {
            return !_filterObj[Race.Eldmen];
          }
        case Race.Keenfolk:
          {
            return !_filterObj[Race.Keenfolk];
          }
        case Race.Velhan:
          {
            return !_filterObj[Race.Velhan];
          }
        case Race.Gorks:
          {
            return !_filterObj[Race.Gorks];
          }
        case Race.Shadowlings:
          {
            return !_filterObj[Race.Shadowlings];
          }
      }

      switch (marketplaceListing.rarity) {
        case Rarity.Common:
          {
            return !_filterObj[Rarity.Common];
          }
        case Rarity.Uncommon:
          {
            return !_filterObj[Rarity.Uncommon];
          }
        case Rarity.Rare:
          {
            return !_filterObj[Rarity.Rare];
          }
        case Rarity.Mythic:
          {
            return !_filterObj[Rarity.Mythic];
          }
        case Rarity.Fabled:
          {
            return !_filterObj[Rarity.Fabled];
          }
      }
      return false;
    });

  }
}