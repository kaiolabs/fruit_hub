import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';

class Welcome extends StatelessWidget {
  final Function() onTapButton;
  const Welcome({super.key, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFffa451),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              child: Image.asset('assets/images/Component_1.png'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: SizedBox(
            width: 315,
            height: 211,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Get The Freshest Fruit Salad Combo',
                      style: TextStyle(
                        fontSize: 16,
                        color: Palette.darkPurple,
                        fontFamily: 'TTNorms_Bold',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Palette.lightPurple,
                        fontFamily: 'TTNorms_Regular',
                      ),
                    ),
                  ],
                ),
                ButtonPattern(
                  lebel: "Let’s Continue",
                  onPressed: () => onTapButton(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
