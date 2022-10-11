// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/tile_basket.dart';
import 'package:provider/provider.dart';

class BodyOrderList extends StatefulWidget {
  const BodyOrderList({super.key});

  @override
  State<BodyOrderList> createState() => _BodyOrderListState();
}

class _BodyOrderListState extends State<BodyOrderList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Expanded(
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
    );
  }
}
