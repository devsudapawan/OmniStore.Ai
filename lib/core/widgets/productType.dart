import 'package:flutter/material.dart';

import '../design/colors.dart';

class productType extends StatelessWidget {
  String title ;
  VoidCallback onViewAll;
  productType({
    super.key,
    required this.title,
    required this.onViewAll,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          child: Text(
            "View All",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}