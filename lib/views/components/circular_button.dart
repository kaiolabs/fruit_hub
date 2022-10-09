import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Widget icon;
  const CircularButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: -3,
              blurRadius: 8,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: 48,
        height: 48,
        child: icon,
      ),
    );
  }
}
