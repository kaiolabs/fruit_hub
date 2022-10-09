import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              SizedBox(
                width: 22,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Color(0xFF333333),
                  size: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                child: Text(
                  'Go back',
                  style: TextStyle(
                    color: Palette.darkPurple,
                    fontSize: 12,
                    fontFamily: 'TTNorms_Medium',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
