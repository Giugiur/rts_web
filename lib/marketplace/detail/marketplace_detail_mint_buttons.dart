import 'package:flutter/material.dart';

class MarketplaceDetailMintButtons extends StatefulWidget {
  const MarketplaceDetailMintButtons({super.key});

  @override
  State<MarketplaceDetailMintButtons> createState() => _MarketplaceDetailMintButtonsState();
}

class _MarketplaceDetailMintButtonsState extends State<MarketplaceDetailMintButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Mint with Credit Card'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          OutlinedButton(
            onPressed: () {},
            child: Text('Mint with SOL'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
