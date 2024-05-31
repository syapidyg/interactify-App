import 'package:flutter/material.dart';
import 'package:interactify_app/models/on_boarding.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({
    super.key,
    required this.onBoarding,
  });

  final OnBoarding onBoarding;

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.height * 0.8;
    double imageHeight = MediaQuery.of(context).size.height * 0.4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: imageWidth,
          height: imageHeight,
          child: Image.asset(
            width: imageWidth,
            height: imageHeight,
            onBoarding.path,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          onBoarding.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
