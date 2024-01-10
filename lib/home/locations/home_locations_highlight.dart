import 'package:flutter/material.dart';

import '../../utils/paragraphs.dart';

class HomeLocationsHighlight extends StatelessWidget {
  final int index;
  HomeLocationsHighlight(this.index, {super.key});

  List<dynamic> locations = [
    {
      'title': 'The Known World',
      'image': 'images/eldmen_background.png',
      'description': loremIpsum,
    },
    {
      'title': 'The Twin Empires',
      'image': 'images/eldmen_background.png',
      'description': theEmpiresDescription,
    },
    {
      'title': 'The Groll Tribes',
      'image': 'images/grolls_background.png',
      'description': loremIpsum,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            locations[index]['title'],
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Container(
            padding: const EdgeInsets.all(50),
            height: deviceSize.height*0.85,
            width: deviceSize.width*0.8,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    locations[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color.fromRGBO(44, 42, 57, 1),],
                        stops: [0, 1]
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      locations[index]['description'],
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
