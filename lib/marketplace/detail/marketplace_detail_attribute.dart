import 'package:flutter/material.dart';

class MarketplaceDetailAttribute extends StatelessWidget {
  final String tag;
  final String label;
  const MarketplaceDetailAttribute(this.tag, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          tag,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 4,),
        Text(
          label,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
