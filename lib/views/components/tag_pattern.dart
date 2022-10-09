import 'package:flutter/cupertino.dart';

class TagPattern extends StatelessWidget {
  final String title;
  const TagPattern({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xFFFAFAFA),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF403E3E),
            fontFamily: 'TTNorms_Regular',
          ),
        ),
      ),
    );
  }
}
