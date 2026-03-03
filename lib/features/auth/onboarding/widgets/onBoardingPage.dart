import 'package:flutter/material.dart';

class onBoardingWidget extends StatelessWidget {
  const onBoardingWidget({
    super.key, required this.images,
  });
  final String images;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        images,fit: BoxFit.fill,
      ),
    );
  }
}