import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class HeroButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  const HeroButton({
    required this.label,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: 220,
      height: 50,
      text: label.toUpperCase(),
      isReverse: true,
      animatedOn: AnimatedOn.onHover,
      backgroundColor: Colors.transparent,
      borderColor: Colors.white,
      selectedBackgroundColor: Theme.of(context).colorScheme.primary,
      selectedTextColor: Colors.white,
      textStyle: Theme.of(context).textTheme.labelLarge!,
      onPress: onTap,
      // child: OutlinedButton(
      //   onPressed: () => Get.toNamed(MARKETPLACE),
      //    style: ButtonStyle(
      //      padding: MaterialStateProperty.all<EdgeInsets>(
      //          const EdgeInsets.all(20)
      //      ),
      //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //         RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(0.0),
      //         ),
      //       ),
      //     ),
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(
      //         'Marketplace'.toUpperCase(),
      //         style: Theme.of(context).textTheme.labelLarge,
      //       ),
      //       const SizedBox(
      //         width: 5,
      //       ),
      //       const Icon(
      //         Icons.double_arrow,
      //         size: 24.0,
      //         color: Colors.white,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
