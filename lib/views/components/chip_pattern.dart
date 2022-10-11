import 'package:flutter/material.dart';

class ChipPattern extends StatelessWidget {
  final String text;
  const ChipPattern({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFB4B4C0).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.2),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
                fontFamily: 'TTNorms_Regular',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
