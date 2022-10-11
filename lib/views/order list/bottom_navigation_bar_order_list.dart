// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/order%20complete/order_complete_view.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarOrderList extends StatefulWidget {
  const BottomNavigationBarOrderList({super.key});

  @override
  State<BottomNavigationBarOrderList> createState() => _BottomNavigationBarOrderListState();
}

class _BottomNavigationBarOrderListState extends State<BottomNavigationBarOrderList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Container(
        height: 70,
        color: const Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'TTNorms_Light',
                      color: Color(0xFF333333),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Moeda.svg',
                          height: 17,
                          width: 17,
                          color: Palette.darkPurple,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            formataPrice(providerfinalizePurchase.totalPriceBasket.toString()),
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'TTNorms_Medium',
                              color: Palette.darkPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 55,
                child: ButtonPattern(
                  lebel: 'Checkout',
                  onPressed: () {
                    if (providerfinalizePurchase.orderListbasket.isNotEmpty) {
                      final confirmaOrder =
                          alertDialogPattern(context, 'Confirm order', 'Do you want to finalize your order?').then((value) {
                        if (value) {
                          Navigator.push(context, animatedRoute(const OrderCompleteView()));
                        }
                      });
                    } else {
                      final confirmaPop =
                          alertDialogPattern(context, 'Empty basket', 'Your basket is empty, please add a request to proceed.')
                              .then((value) {
                        if (value) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
