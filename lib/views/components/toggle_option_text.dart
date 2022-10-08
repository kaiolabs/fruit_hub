import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class ToggleOptionText extends StatelessWidget {
  final String title;
  final int index;
  final ValueNotifier<int> typePlate;
  const ToggleOptionText({super.key, required this.title, required this.index, required this.typePlate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: () {
          typePlate.value = index;
        },
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: (typePlate.value == index) ? Palette.darkPurple : const Color.fromARGB(136, 37, 63, 102),
            fontFamily: 'TTNorms_Regular',
          ),
        ),
      ),
    );
  }
}
