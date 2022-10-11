// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/button_pattern.dart';
import 'package:fruit_hub/views/components/favorited_button.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarAddBasket extends StatefulWidget {
  final String title;
  final String imagePath;
  final int colorCardExadecimal;
  ValueNotifier<bool> isFavorited;

  BottomNavigationBarAddBasket({
    super.key,
    required this.title,
    required this.imagePath,
    required this.colorCardExadecimal,
    required this.isFavorited,
  });

  @override
  State<BottomNavigationBarAddBasket> createState() => _BottomNavigationBarStateAddBasket();
}

class _BottomNavigationBarStateAddBasket extends State<BottomNavigationBarAddBasket> {
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
    );
  }
}
