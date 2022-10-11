import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/divider_pattern.dart';
import 'package:fruit_hub/views/components/loader_cards.dart';
import 'package:fruit_hub/views/components/toggle_option_text.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  ValueNotifier<int> typePlate = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Recommended Combo',
                style: TextStyle(
                  fontSize: 18,
                  color: Palette.darkPurple,
                  fontFamily: 'TTNorms_Medium',
                ),
              ),
              DividerPattern(width: 60),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
          child: const LoaderCards(assetJson: 'assets/mocks/mock_plates_recommended.json'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: typePlate,
                builder: (context, value, child) => Row(
                  children: [
                    ToggleOptionText(title: 'Hottest', index: 0, typePlate: typePlate),
                    ToggleOptionText(title: 'Popular', index: 1, typePlate: typePlate),
                    ToggleOptionText(title: 'New Combo', index: 2, typePlate: typePlate),
                  ],
                ),
              ),
              const DividerPattern(width: 40),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
          ),
          child: const LoaderCards(assetJson: 'assets/mocks/mock_plates.json'),
        ),
      ],
    );
  }
}
