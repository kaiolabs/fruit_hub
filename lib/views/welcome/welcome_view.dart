import 'package:flutter/material.dart';
import 'package:fruit_hub/views/welcome/welcome.dart';
import 'package:fruit_hub/views/welcome/welcome_authentication.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Welcome(
          onTapButton: () {
            _pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          },
        ),
        WelcomeAuthentication(),
      ],
    ));
  }
}
