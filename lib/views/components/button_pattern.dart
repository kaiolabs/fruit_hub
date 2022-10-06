import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class ButtonPattern extends StatelessWidget {
  final String lebel;
  final Function() onPressed;
  const ButtonPattern({super.key, required this.lebel, required this.onPressed});

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
        color: Palette.orange,
        child: InkWell(
          onTap: () => onPressed(),
          child: Center(
            child: Text(
              lebel,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'TTNorms_Medium',
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
