import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';
import '../../NFTs/NFTModel.dart';

class MarketplaceDetailPassivePopup extends StatelessWidget {
  final NFTModel assetDetail;
  const MarketplaceDetailPassivePopup(this.assetDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(assetDetail.classs == Classs.Unit ? 'Passives: ' : 'Passive: ',),
        Row(
            children: assetDetail.passives.map(
                    (passive) => InfoPopupWidget(
                  contentTitle: 'When receiving Ranged damage, it reduces incoming damage from Ranged attacks by 30% and Movement Speed by 15% for 2 seconds.',
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
                    assetDetail.passives.length-1 == assetDetail.passives.indexOf(passive) ? '$passive.' : '$passive, ',
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
