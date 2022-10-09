import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/shared/palette.dart';

class DividerPattern extends StatelessWidget {
  final double width;
  const DividerPattern({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 2,
      width: width,
      color: Palette.orange,
    );
  }
}
