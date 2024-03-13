
import 'package:flutter/material.dart';

import '../../../core/shared/dimension/dimension.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            'Height    1.0m',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Dimension.k10DH,
          Text(
            'Weight    13.0kg',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Dimension.k10DH,
          Text(
            'Abilities  . overgrow',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            '                  . chlorophyll',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
