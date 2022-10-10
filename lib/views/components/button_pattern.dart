import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class ButtonPattern extends StatelessWidget {
  final String lebel;
  final Color? color;
  final Color? textColor;
  final String? fontFamily;
  final Function() onPressed;
  const ButtonPattern({
    super.key,
    required this.lebel,
    required this.onPressed,
    this.color = Palette.orange,
    this.textColor = Colors.white,
    this.fontFamily = 'TTNorms_Medium',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: color,
        child: InkWell(
          onTap: () => onPressed(),
          child: Center(
            child: Text(
              lebel,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'TTNorms_Medium',
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
