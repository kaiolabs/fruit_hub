// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/order%20list/HeaderOrderList.dart';
import 'package:fruit_hub/views/order%20list/bode_order_list.dart';
import 'package:fruit_hub/views/order%20list/bottom_navigation_bar_order_list.dart';
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
      builder: (context, providerfinalizePurchase, child) => WillPopScope(
        onWillPop: () {
          if (providerfinalizePurchase.orderListbasket.isNotEmpty) {
            final confirmaPop = alertDialogPattern(context, 'Request', 'You didn\'t complete the order, do you want to leave anyway?').then(
              (value) {
                if (value) {
                  Navigator.pop(context);
                }
              },
            );
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: Scaffold(
          bottomNavigationBar: const BottomNavigationBarOrderList(),
          body: SafeArea(
            child: Column(
              children: const [
                HeaderOrderList(),
                BodyOrderList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
