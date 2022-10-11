import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/shared/functions.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/divider_pattern.dart';
import 'package:fruit_hub/views/components/tag_pattern.dart';
import 'package:provider/provider.dart';

class BodyAddBasket extends StatefulWidget {
  final String title;
  final List listTags;
  final String description;
  const BodyAddBasket({
    super.key,
    required this.title,
    required this.listTags,
    required this.description,
  });

  @override
  State<BodyAddBasket> createState() => _BodyAddBasketState();
}

class _BodyAddBasketState extends State<BodyAddBasket> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderfinalizePurchase>(
      builder: (context, providerfinalizePurchase, child) => Expanded(
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
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: const Color(0xFFFFF2E7)),
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
                            for (var i = 0; i < widget.listTags.length; i++) TagPattern(title: widget.listTags[i]),
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
    );
  }
}
