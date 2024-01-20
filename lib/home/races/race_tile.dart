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
          duration: const Duration(milliseconds: 1000),
          child: Container(
            width: 7,
            height: selected? 125 : 120,
            color: race.color
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          child: Container(
            width: selected ? 510 : 500,
            height: selected? 125 : 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/${race.name.toLowerCase()}_background.png'),
                colorFilter: ColorFilter.mode(selected ? Colors.black87: Colors.black26, BlendMode.dstATop),
                fit: BoxFit.cover,
              ),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(44, 42, 57, 1),
                    Color.fromRGBO(42, 59, 79, 1)
                  ]
              ),
            ),
            child: selected ? GlowText(
              race.label.toUpperCase(),
              style: TextStyle(fontSize: 34, color: Colors.white),
            ) : Text(
              race.label.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}
