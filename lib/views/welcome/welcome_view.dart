import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xFFffa451),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
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
                          color: Color(0xFF27214D),
                          fontFamily: 'TTNorms_Bold',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'We deliver the best and freshest fruit salad in town. Order for a combo today!!!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF5D577E),
                          fontFamily: 'TTNorms_Regular',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 56,
                    child: Material(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: const Color(0xFFffa451),
                      child: InkWell(
                        onTap: () {},
                        child: const Center(
                          child: Text(
                            'Learn More',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'TTNorms_regular',
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
