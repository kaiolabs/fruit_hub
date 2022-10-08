import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/ini_local.dart';
import 'package:fruit_hub/views/home/home_view.dart';
import 'package:fruit_hub/views/welcome/welcome_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  bool isLogado = IniLocal.readBool('Login', 'Permanecer conectado');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 600),
            builder: (context, double value, child) {
              return AnimatedOpacity(
                opacity: value,
                onEnd: () {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      isLogado
                          ? Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const HomeView()), (Route<dynamic> route) => false)
                          : Navigator.of(context)
                              .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomeView()), (Route<dynamic> route) => false);
                    },
                  );
                },
                duration: const Duration(milliseconds: 600),
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              );
            },
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
        ),
      ),
    );
  }
}
