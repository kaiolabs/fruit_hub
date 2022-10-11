// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/go_back_button.dart';
import 'package:provider/provider.dart';

class HeaderAddBasket extends StatefulWidget {
  final String imagePath;
  const HeaderAddBasket({super.key, required this.imagePath});

  @override
  State<HeaderAddBasket> createState() => _HeaderAddBasketState();
}

class _HeaderAddBasketState extends State<HeaderAddBasket> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 20, bottom: 10),
            child: GoBackButton(onPressed: () {
              final confirmaPop =
                  alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?').then((value) {
                if (value) {
                  providerfinalizePurchase.resetAll();
                  Navigator.pop(context);
                }
              });
            }),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Hero(
                tag: widget.imagePath,
                child: Image.asset(
                  widget.imagePath,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
