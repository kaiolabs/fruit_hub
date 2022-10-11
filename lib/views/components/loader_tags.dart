import 'package:flutter/material.dart';
import 'package:fruit_hub/views/components/chip_pattern.dart';

class LoaderTags extends StatelessWidget {
  final List tags;

  final double height;
  const LoaderTags({
    super.key,
    required this.tags,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB4B4C0).withOpacity(0.07),
      height: height,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          const SizedBox(width: 24),
          for (var tag in tags) ChipPattern(text: tag),
        ],
      ),
    );
  }
}
