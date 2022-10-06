import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';

class WelcomeAuthentication extends StatelessWidget {
  WelcomeAuthentication({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: const Color(0xFFffa451),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Image.asset('assets/images/Component_2.png'),
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
                    children: [
                      const Text(
                        'What is your firstname?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Palette.darkPurple,
                          fontFamily: 'TTNorms_Medium',
                        ),
                      ),
                      const SizedBox(height: 17),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Chris',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'TTNorms_Medium',
                          ),
                          // borda com 10 e cor laranja
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonPattern(
                    lebel: "Start Ordering",
                    onPressed: () {},
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
