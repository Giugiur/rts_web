import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rts_web/utils/utils.dart';
import '../NFTs/NFTModel.dart';
import '../marketplace/marketplace_rarity_tag.dart';
import '../utils/constants.dart';

class ICard extends StatefulWidget {
  final NFTModel nftModel;
  const ICard(this.nftModel, {super.key});

  @override
  State<ICard> createState() => _ICardState();
}

class _ICardState extends State<ICard> {

  bool isHover = false;
  Offset mousePosition = const Offset(0,0);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onHover: (e) {
        setState(() {
          mousePosition += e.delta;
          mousePosition *= 0.9;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: Stack(
        children: [
          backgroundImage(),
          Container(
            width: 700,
            height: 1000,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color.fromRGBO(44, 42, 57, 1),],
                stops: [0.5, 2]
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.nftModel.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 100,
                      width: 150,
                      child: MarketplaceRarityTag(widget.nftModel.rarity),
                    ),
                  ],
                )
              ),
            ),
          ),

        ],
      ),
    );
  }
  
  backgroundImage() {
    return AnimatedPositioned(
      duration: const Duration (milliseconds: 1000),
      curve: Curves.easeOutCubic,
      top: isHover ? -40 + mousePosition.dy: 0,
      left: isHover ? -50 + mousePosition.dx : -100,
      width: 800,
      child: Container(
        width: 700,
        height: 1200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.nftModel.imageUrl)
          )
        ),
      ),

    );
  }
}
