import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class PlateCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final Color? colorCard;
  final Function()? onTap;
  const PlateCard({super.key, required this.imagePath, required this.title, required this.price, this.onTap, this.colorCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 183,
      margin: const EdgeInsets.only(right: 23),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFFF7F5F5)),
      child: Material(
        color: colorCard ?? const Color(0xFFF7F5F5),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.scaleDown,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite_border_sharp,
                        color: Palette.orange,
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
                    Text(
                      '₦ $price',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Palette.orange,
                        fontFamily: 'TTNorms_Medium',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFFFFF2E7),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Palette.orange,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
