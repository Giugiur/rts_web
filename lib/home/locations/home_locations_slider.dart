import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/paragraphs.dart';

class HomeLocationSlider extends StatelessWidget {
  HomeLocationSlider({super.key});
  List<dynamic> locations = [
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
    {
      'title': 'The Free Cities of Tentria',
      'image': 'images/travelers_background.png',
      'description': loremIpsum,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
          options: CarouselOptions(
            height: deviceSize.height,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
          ),
          items: locations.map((index) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: Image.asset(
                          index['image'],
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
                            height: 350,
                            width: 1000,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    index['title'],
                                    style: Theme.of(context).textTheme.headlineLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(height: 40,),
                                Text(
                                  index['description'],
                                  style: Theme.of(context).textTheme.labelLarge,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        )
    );
  }
}
