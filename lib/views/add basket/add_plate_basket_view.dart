// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/add%20basket/body_add_basket.dart';
import 'package:fruit_hub/views/add%20basket/bottom_navigation_bar_add_basket.dart';
import 'package:fruit_hub/views/add%20basket/header_add_basket.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
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
          final confirmaPop =
              alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?').then((value) {
            if (value) {
              providerfinalizePurchase.resetAll();
              Navigator.pop(context);
            }
          });

          return confirmaPop;
        },
        child: Scaffold(
          backgroundColor: Palette.orange,
          bottomNavigationBar: BottomNavigationBarAddBasket(
            colorCardExadecimal: widget.colorCardExadecimal,
            imagePath: widget.imagePath,
            title: widget.title,
            isFavorited: widget.isFavorited,
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderAddBasket(imagePath: widget.imagePath),
                BodyAddBasket(
                  title: widget.title,
                  description: widget.description,
                  listTags: listTags,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
