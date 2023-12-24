import 'package:get/get.dart';
import 'package:rts_web/API/API.dart';
import 'package:rts_web/NFTs/NFTModel.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';

class MarketplaceDetailController extends GetxController {

  NFTsController nftsController = Get.put(NFTsController());
  late NFTModel assetDetail;
  late List<dynamic> passiveDescriptions = [];
  bool _isReady = false;

  get isReady => _isReady;

  @override
  void onInit() async {
    var id = Get.parameters['id'];
    List<NFTModel> nfts = await nftsController.getNFTs();
    assetDetail = nfts.firstWhere((nft) => nft.id == id);
    // TODo: Move it to a more general place so we avoid doing too many calls
    if (passiveDescriptions.isEmpty) {
      passiveDescriptions = await API().getPassives();
    }
    fillDescriptions(assetDetail);
    super.onInit();
    _isReady = true;
    update();
  }

  void fillDescriptions(NFTModel assetDetail) {
    for (var passive in assetDetail.passives) {
      dynamic description = passiveDescriptions.firstWhere((description) => description['id'] == passive['name'], orElse: () => passive['description'] = 'No description found');
      if (description != 'No description found') {
        passive['description'] = description['data']['description'];
      }
    }
  }

}