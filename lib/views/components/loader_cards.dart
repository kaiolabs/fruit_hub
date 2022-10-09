import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruit_hub/models/plate.dart';
import 'package:fruit_hub/views/components/plate_card.dart';

class LoaderCards extends StatefulWidget {
  final String assetJson;
  const LoaderCards({super.key, required this.assetJson});

  @override
  State<LoaderCards> createState() => _LoaderCardsState();
}

class _LoaderCardsState extends State<LoaderCards> {
  Future loadData(context, String assetJson) async {
    String data = await DefaultAssetBundle.of(context).loadString(assetJson);
    final jsonResult = jsonDecode(data);
    List<Plate> listPlates = [];

    for (var item in jsonResult) {
      listPlates.add(Plate(
        id: item['id'],
        name: item['name'],
        description: item['description'],
        price: item['price'],
        image: item['image'],
        comboContains: item['comboContains'],
        colorCardExadecimal: int.parse(item['colorCardExadecimal'] ?? '0xFFFFFFFF'),
      ));
    }
    return listPlates;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 190,
      ),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: loadData(context, widget.assetJson),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.only(right: 24),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PlateCard(
                  id: snapshot.data[index].id,
                  imagePath: snapshot.data[index].image,
                  title: snapshot.data[index].name,
                  price: snapshot.data[index].price,
                  colorCardExadecimal: snapshot.data[index].colorCardExadecimal,
                  comboContains: snapshot.data[index].comboContains,
                  description: snapshot.data[index].description,
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
