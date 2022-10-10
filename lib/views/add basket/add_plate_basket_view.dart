// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/components/divider_pattern.dart';
import 'package:fruit_hub/views/components/favorited_button.dart';
import 'package:fruit_hub/views/components/go_back_button.dart';
import 'package:fruit_hub/views/components/tag_pattern.dart';
import 'package:provider/provider.dart';

class AddPlateBasketView extends StatefulWidget {
  final int id;
  final int price;
  final String title;
  final String imagePath;
  final String description;
  final List comboContains;
  final int colorCardExadecimal;
  ValueNotifier<bool> isFavorited;

  AddPlateBasketView({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.isFavorited,
    required this.comboContains,
    required this.colorCardExadecimal,
  });

  @override
  State<AddPlateBasketView> createState() => _AddPlateBasketViewState();
}

class _AddPlateBasketViewState extends State<AddPlateBasketView> {
  List listTags = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProviderfinalizePurchase>(context, listen: false).init(widget.price);
    });

    for (var i = 0; i < widget.comboContains.length; i++) {
      listTags.add(widget.comboContains[i]['name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => WillPopScope(
        onWillPop: () {
          final confirmaPop = alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?');
          if (confirmaPop) {
            providerfinalizePurchase.resetAll();
          }
          return confirmaPop;
        },
        child: Scaffold(
          backgroundColor: Palette.orange,
          bottomNavigationBar: Container(
            height: 70,
            color: const Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FavoritedButton(
                    isFavorited: widget.isFavorited,
                    size: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 55,
                    child: ButtonPattern(
                      lebel: 'Add To Basket',
                      onPressed: () {
                        final confirmaPedido = alertDialogPattern(
                          context,
                          'Confirm order',
                          'Plate: ${widget.title}\n\nQuantity: ${providerfinalizePurchase.counter} \n\nTotal Price: ${formataPrice(providerfinalizePurchase.totalPrice.toString())}',
                        ).then((value) {
                          if (value) {
                            providerfinalizePurchase.addOrderList(
                              {
                                'title': widget.title,
                                'imagePath': widget.imagePath,
                                'quantity': providerfinalizePurchase.counter,
                                'price': providerfinalizePurchase.totalPrice,
                                'colorCardExadecimal': widget.colorCardExadecimal,
                              },
                            );
                            providerfinalizePurchase.resetAll();
                            Navigator.pop(context);
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26, top: 20, bottom: 10),
                  child: GoBackButton(onPressed: () {
                    final confirmaPop =
                        alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?')
                            .then((value) {
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
                                  child: Text(
                                    upCaser(widget.title),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Palette.darkPurple,
                                      fontFamily: 'TTNorms_Medium',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 32,
                                              width: 32,
                                              decoration:
                                                  BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFFFF2E7)),
                                              child: Material(
                                                color: const Color(0xFFFFF2E7),
                                                borderRadius: BorderRadius.circular(25),
                                                child: InkWell(
                                                  borderRadius: BorderRadius.circular(25),
                                                  child: const Icon(Icons.remove, color: Palette.orange, size: 24),
                                                  onTap: () {
                                                    providerfinalizePurchase.decrement();
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text(
                                              providerfinalizePurchase.counter.toString(),
                                              style: const TextStyle(
                                                fontSize: 24,
                                                color: Palette.darkPurple,
                                                fontFamily: 'TTNorms_Regular',
                                              ),
                                            ),
                                            Container(
                                              height: 32,
                                              width: 32,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: const Color(0xFFFFF2E7),
                                              ),
                                              child: Material(
                                                color: const Color(0xFFFFF2E7),
                                                borderRadius: BorderRadius.circular(25),
                                                child: InkWell(
                                                  borderRadius: BorderRadius.circular(25),
                                                  child: const Icon(Icons.add, color: Palette.orange, size: 24),
                                                  onTap: () {
                                                    providerfinalizePurchase.increment();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/Moeda.svg',
                                            height: 17,
                                            width: 17,
                                            color: Palette.darkPurple,
                                          ),
                                          Text(
                                            formataPrice(providerfinalizePurchase.totalPrice.toString()),
                                            style: const TextStyle(
                                              fontSize: 24,
                                              color: Palette.darkPurple,
                                              fontFamily: 'TTNorms_Medium',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25, bottom: 8),
                                  child: Divider(color: Colors.grey[200], thickness: 1),
                                ),
                                const Text(
                                  'This combo contains:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Palette.darkPurple,
                                    fontFamily: 'TTNorms_Regular',
                                  ),
                                ),
                                const DividerPattern(width: 60),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  child: Wrap(
                                    children: [
                                      for (var i = 0; i < listTags.length; i++) TagPattern(title: listTags[i]),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Divider(
                                    color: Colors.grey[200],
                                    thickness: 1,
                                  ),
                                ),
                                Text(
                                  widget.description,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF333333),
                                    fontFamily: 'TTNormsPro_Light',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
