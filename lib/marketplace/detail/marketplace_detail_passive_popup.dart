import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_popup/info_popup.dart';
import 'marketplace_detail_controller.dart';
import '../../NFTs/NFTModel.dart';

class MarketplaceDetailPassivePopup extends StatelessWidget {
  final NFTModel assetDetail;
  MarketplaceDetailPassivePopup(this.assetDetail, {super.key});
  final MarketplaceDetailController marketplaceDetailController = Get.put(MarketplaceDetailController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(assetDetail.classs == Classs.Unit ? 'Passives: ' : 'Passive: ',),
        Row(
          children: assetDetail.passives.map((passive) => InfoPopupWidget(
            customContent: () => Container(
              width: 500,
              color:  Colors.black, //ToDo: Change this one
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(passive['description']),
              ),
            ),
            arrowTheme: InfoPopupArrowTheme(
              color: Theme.of(context).colorScheme.primary,
              arrowDirection: ArrowDirection.down,
            ),
            contentTheme: InfoPopupContentTheme(
              infoContainerBackgroundColor: Colors.black38,
              infoTextStyle: DefaultTextStyle.of(context).style,
              contentPadding: const EdgeInsets.all(8),
              contentBorderRadius: const BorderRadius.all(Radius.circular(0)),
              infoTextAlign: TextAlign.center,
            ),
            child: Text(
              assetDetail.passives.length-1 == assetDetail.passives.indexOf(passive) ? '${passive['name']}.' : '${passive['name']}, ',
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Theme.of(context).colorScheme.primary,
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          )).toList()
        ),
      ]
    );
    // return RichText(
    //   text: TextSpan(
    //     text: assetDetail.classs == Classs.Unit ? 'Passives: ' : 'Passive: ',
    //     style: DefaultTextStyle.of(context).style,
    //     children: assetDetail.passives.map(
    //       (passive) => TextSpan(
    //         text: assetDetail.passives.length-1 == assetDetail.passives.indexOf(passive) ? '$passive.' : '$passive, ',
    //         style: TextStyle(
    //           shadows: [
    //             Shadow(
    //               color: Theme.of(context).colorScheme.primary,
    //               blurRadius: 2,
    //               offset: const Offset(1, 1),
    //             ),
    //           ],
    //         ),
    //       )).toList()
    //   ),
    // );
  }
}
