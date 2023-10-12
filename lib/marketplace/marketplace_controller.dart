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
      MarketplaceListing(id: '0', name: 'Quintus Stormhelm', imageUrl: 'https://i.imgur.com/FfE62PM.png'),
      MarketplaceListing(id: '1', name: 'Tinman', imageUrl: 'https://i.imgur.com/4Lp8gIz.png'),
      MarketplaceListing(id: '2', name: 'Forestborn', imageUrl: 'https://i.imgur.com/wuXeXZX.png'),
    ];
  }
}