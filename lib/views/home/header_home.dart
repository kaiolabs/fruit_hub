import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/ini_local.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/circular_button.dart';
import 'package:fruit_hub/views/components/loader_tags.dart';
import 'package:fruit_hub/views/home/search_bar.dart';
import 'package:fruit_hub/views/order%20list/basket_view.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({super.key});

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  final List listTags = ['All', 'Salad Combo', 'Berry Combo', 'Mango Berry'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(child: SvgPicture.asset('assets/images/Menu.svg'), onTap: () {}),
                  const SizedBox(width: 16),
                  Text(
                    'Welcome, ${IniLocal.readString('Login', 'User name')}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Palette.darkPurple,
                      fontFamily: 'TTNorms_Medium',
                    ),
                  ),
                ],
              ),
              CircularButton(
                icon: SvgPicture.asset(
                  'assets/images/Shop.svg',
                  fit: BoxFit.scaleDown,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    animatedRoute(const OrderListView()),
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
            bottom: 18,
            left: 24,
            right: 24,
          ),
          child: const SearchBar(),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.04,
          ),
          child: LoaderTags(
            tags: listTags,
            height: 45,
          ),
        ),
      ],
    );
  }
}
