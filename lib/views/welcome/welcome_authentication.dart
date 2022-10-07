import 'package:flutter/material.dart';
import 'package:fruit_hub/controllers/ini_local.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/components/input_field.dart';
import 'package:fruit_hub/views/home/home_view.dart';

class WelcomeAuthentication extends StatefulWidget {
  const WelcomeAuthentication({super.key});

  @override
  State<WelcomeAuthentication> createState() => _WelcomeAuthenticationState();
}

class _WelcomeAuthenticationState extends State<WelcomeAuthentication> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFffa451),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
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
                        InputField(
                          hintText: 'Chris',
                          controller: _nameController,
                        ),
                      ],
                    ),
                    ButtonPattern(
                      lebel: "Start Ordering",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          IniLocal.writeBool('Login', 'Permanecer conectado', true);
                          IniLocal.writeString('Login', 'User name', _nameController.text);
                          Navigator.of(context).push(animatedRoute(const HomeView()));
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
