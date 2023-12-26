import 'package:flutter/material.dart';

import '../../NFTs/NFTModel.dart';

class MarketplaceDetailBonusDescription extends StatelessWidget {
  final NFTModel assetDetail;
  const MarketplaceDetailBonusDescription(this.assetDetail, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          assetDetail.classs == Classs.Doctrine ? 'Bonuses: ' : 'Bonus: ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: assetDetail.bonuses.map((bonus) => Container(
            child: Text(
              '- $bonus',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )).toList()
        )
      ]
    );
  }
}
