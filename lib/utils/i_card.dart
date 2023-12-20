import 'package:flutter/material.dart';
import 'package:rts_web/utils/utils.dart';
import '../marketplace/marketplace_listing_model.dart';

class ICard extends StatefulWidget {
  final MarketplaceListing marketplaceListing;
  const ICard(this.marketplaceListing, {super.key});

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
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: isHover ? 15 : 2,
              spreadRadius: isHover ? 5 : 2,
              color: getRarityColor(widget.marketplaceListing.rarity),
            )
          ]
        ),
        child: Stack(
          children: [
            backgroundImage(),
          ],
        ),
      ),
    );
  }
  
  backgroundImage() {
    return AnimatedPositioned(
      duration: const Duration (milliseconds: 1000),
      curve: Curves.easeOutCubic,
      top: isHover ? -40 + mousePosition.dy: 0,
      left: isHover ? -50 + mousePosition.dx : -100,
      height: isHover ? 1000 : 900,
      width: 800,
      child: Container(
        width: 800,
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/${widget.marketplaceListing.name}.png')
          )
        ),
      ),

    );
  }
}
