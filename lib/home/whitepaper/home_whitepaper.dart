import 'package:flutter/material.dart';

class HomeWhitepaper extends StatelessWidget {
  const HomeWhitepaper({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width,
      height: deviceSize.height,
      color: Colors.black,
      child: Center(
        child: ElevatedButton(
          onPressed: () {  },
          child: Text(
              'Read our Whitepaper'
          ),
        ),
      ),
    );
  }
}
