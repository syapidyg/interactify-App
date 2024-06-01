import 'package:flutter/material.dart';
import 'package:interactify_app/models/on_boarding.dart';
import 'package:interactify_app/widgets/on_board_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  static final PageController _pageController = PageController(initialPage: 0);
  static final routeName = "/OnBoardingPage";

  static final OnBoarding onBoarding_page1 = OnBoarding(
      title: "help you share best videos with everyone.",
      path: "assets/images/rafiki.png",
      pageController: _pageController);
  static final OnBoarding onBoarding_page2 = OnBoarding(
      title: "You can create the most impressive moment.",
      path: "assets/images/bro.png",
      pageController: _pageController);
  static final OnBoarding onBoarding_page3 = OnBoarding(
      title: "Let Make Explore.",
      path: "assets/images/echelle.png",
      pageController: _pageController);

  List<Widget> _onBoardingCard = [
    OnBoardCard(onBoarding: onBoarding_page1),
    OnBoardCard(onBoarding: onBoarding_page2),
    OnBoardCard(onBoarding: onBoarding_page3)
  ];

  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: PageView(
                  controller: _pageController, children: _onBoardingCard)),
        ],
      ),
    ));
  }
}
