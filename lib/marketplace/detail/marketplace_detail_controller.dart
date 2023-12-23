import 'package:get/get.dart';
import 'package:rts_web/NFTs/NFTModel.dart';
import 'package:rts_web/NFTs/NFTs_controller.dart';

class MarketplaceDetailController extends GetxController {

  NFTsController nftsController = Get.put(NFTsController());
  late NFTModel assetDetail;
  bool _isReady = false;

  get isReady => _isReady;

  @override
  void onInit() async {
    var id = Get.parameters['id'];
    List<NFTModel> nfts = await nftsController.getNFTs();
    assetDetail = nfts.firstWhere((nft) => nft.id == id);
    _isReady = true;
    update();
    super.onInit();
  }
}