import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

import '../../NFTs/NFTModel.dart';

class RaceTile extends StatelessWidget {
  final bool selected;
  final Race race;
  const RaceTile(
    this.selected,
    this.race,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
          width: 5,
          height: selected? 75 : 70,
          color: selected ? race.color : const Color(0xFF1c1c21),
        ),
        const SizedBox(width: 10,),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
          width: selected ? 510 : 500,
          height: selected? 75 : 70,
          decoration: selected ? BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  race.color.withOpacity(0.5),
                ]
            ),
          ) : const BoxDecoration(),
          child: Row(
            children: [
              Icon(race.icon),
              const SizedBox(width: 10,),
              selected ? GlowText(
                race.label.toUpperCase(),
                style: const TextStyle(fontSize: 34, color: Colors.white),
              ) : Text(
                race.label.toUpperCase(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),

        ),
      ],
    );
  }
}
