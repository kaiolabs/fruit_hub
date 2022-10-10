import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/home/home_view.dart';
import 'package:provider/provider.dart';

class OrderCompleteView extends StatelessWidget {
  const OrderCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderfinalizePurchase>(
        builder: (context, providerfinalizePurchase, child) => SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 500),
                      builder: (context, value, child) => Transform.scale(
                        scale: value,
                        child: Opacity(
                          alwaysIncludeSemantics: true,
                          opacity: value,
                          child: child,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: 164,
                        height: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(82),
                          color: const Color(0xFFE0FFE5),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/ok.svg',
                          width: 108,
                          height: 108,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
                  child: const Text(
                    'Order Taken',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'TTNorms_Regular',
                      color: Palette.darkPurple,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                    bottom: MediaQuery.of(context).size.width * 0.13,
                  ),
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                      'Your order have been taken and is being attended to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'TTNormsPro_Light',
                        color: Color(0xFF111111),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 208,
                  child: ButtonPattern(
                    lebel: 'Track order',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.06),
                  child: SizedBox(
                    width: 183,
                    child: ButtonPattern(
                      lebel: 'Continue shopping',
                      textColor: const Color(0xFFF08626),
                      fontFamily: 'TTNorms_Regular',
                      color: const Color(0xFFFCF6F0),
                      onPressed: () {
                        providerfinalizePurchase.clearList();
                        Navigator.pushAndRemoveUntil(context, animatedRoute(const HomeView()), (route) => false);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
