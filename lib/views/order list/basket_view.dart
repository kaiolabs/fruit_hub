// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/components/go_back_button.dart';
import 'package:fruit_hub/views/components/tile_basket.dart';
import 'package:fruit_hub/views/order%20complete/order_complete_view.dart';
import 'package:provider/provider.dart';

class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderfinalizePurchase>(context, listen: false).totalPurchaseAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Scaffold(
        bottomNavigationBar: Container(
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
        body: SafeArea(
          child: Column(
            children: [
              Container(
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
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: providerfinalizePurchase.orderListbasket.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return TileBasket(
                              title: providerfinalizePurchase.orderListbasket[index]['title'],
                              price: providerfinalizePurchase.orderListbasket[index]['price'],
                              quantity: providerfinalizePurchase.orderListbasket[index]['quantity'],
                              imagePath: providerfinalizePurchase.orderListbasket[index]['imagePath'],
                              colorCardExadecimal: providerfinalizePurchase.orderListbasket[index]['colorCardExadecimal'],
                              onTap: () {
                                final confirmaSair =
                                    alertDialogPattern(context, 'Delete order', 'Do you really want to delete this item?').then((value) {
                                  if (value == true) {
                                    providerfinalizePurchase.removeOrderList(index);
                                    providerfinalizePurchase.totalPurchaseAmount();
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
