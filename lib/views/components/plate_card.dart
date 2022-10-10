import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/add%20basket/add_plate_basket_view.dart';
import 'package:fruit_hub/views/components/favorited_button.dart';
import 'package:provider/provider.dart';

class PlateCard extends StatelessWidget {
  final int id;
  final String imagePath;
  final String title;
  final int price;
  final int? colorCardExadecimal;
  final String description;
  final List comboContains;

  const PlateCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.colorCardExadecimal,
    required this.description,
    required this.comboContains,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isFavorited = ValueNotifier(false);

    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Container(
        constraints: const BoxConstraints(
          maxWidth: 152,
          maxHeight: 173,
        ),
        margin: const EdgeInsets.only(right: 23),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFFFFFFFF)),
        child: Material(
          color: Color(colorCardExadecimal ?? 0xFFFFFFFF),
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: imagePath,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.scaleDown,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FavoritedButton(
                          isFavorited: isFavorited,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Palette.darkPurple,
                    fontFamily: 'TTNorms_Medium',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/Moeda.svg'),
                          Text(
                            formataPrice(price.toString()),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Palette.orange,
                              fontFamily: 'TTNorms_Medium',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFFFF2E7)),
                        child: const Icon(Icons.add, color: Palette.orange, size: 24),
                      ),
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              providerfinalizePurchase.resetAll();
              Navigator.push(
                context,
                animatedRoute(
                  AddPlateBasketView(
                    id: id,
                    title: title,
                    price: price,
                    imagePath: imagePath,
                    description: description,
                    isFavorited: isFavorited,
                    comboContains: comboContains,
                    colorCardExadecimal: colorCardExadecimal ?? 0xFFFFFFFF,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
