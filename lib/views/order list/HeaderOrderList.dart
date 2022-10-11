// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/go_back_button.dart';
import 'package:provider/provider.dart';

class HeaderOrderList extends StatefulWidget {
  const HeaderOrderList({super.key});

  @override
  State<HeaderOrderList> createState() => _HeaderOrderListState();
}

class _HeaderOrderListState extends State<HeaderOrderList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Container(
        color: Palette.orange,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 26, right: 32),
                child: GoBackButton(
                  onPressed: () {
                    if (providerfinalizePurchase.orderListbasket.isNotEmpty) {
                      final confirmaPop =
                          alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?')
                              .then((value) {
                        if (value) {
                          Navigator.pop(context);
                        }
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
                )),
            const Text('My Basket', style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'TTNorms_Medium')),
          ],
        ),
      ),
    );
  }
}
