import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../../widgets/hero_button.dart';

class HomeWhitepaper extends StatelessWidget {
  const HomeWhitepaper({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceSize.width,
              child: Center(
                child: Text(
                  'Want to know more?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            HeroButton(
              label: 'Read our Whitepaper',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
