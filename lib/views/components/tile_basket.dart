import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';

class TileBasket extends StatelessWidget {
  final int price;
  final String title;
  final int quantity;
  final String imagePath;
  final Function()? onTap;
  final int colorCardExadecimal;
  const TileBasket({
    super.key,
    this.onTap,
    required this.title,
    required this.price,
    required this.quantity,
    required this.imagePath,
    required this.colorCardExadecimal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: 65,
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Color(colorCardExadecimal), borderRadius: BorderRadius.circular(10)),
                child: Image.asset(imagePath, height: 40, width: 40),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.darkPurple,
                      fontFamily: 'TTNorms_Medium',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '$quantity packs',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Palette.darkPurple,
                        fontFamily: 'TTNorms_Light',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          'assets/images/Moeda.svg',
                          color: Palette.darkPurple,
                        ),
                      ),
                      Text(
                        formataPrice(price.toString()),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Palette.darkPurple,
                          fontFamily: 'TTNorms_Medium',
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Color(colorCardExadecimal)),
            child: Material(
              color: const Color(0xFFFFF2E7),
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: onTap,
                child: const Icon(Icons.remove, color: Palette.orange, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
