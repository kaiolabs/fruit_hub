import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/controllers/ini_local.dart';
import 'package:fruit_hub/shared/animated_route.dart';
import 'package:fruit_hub/shared/palette.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/components/circular_button.dart';
import 'package:fruit_hub/views/components/divider_pattern.dart';
import 'package:fruit_hub/views/components/loader_cards.dart';
import 'package:fruit_hub/views/components/loader_tags.dart';
import 'package:fruit_hub/views/components/toggle_option_text.dart';
import 'package:fruit_hub/views/home/search_bar.dart';
import 'package:fruit_hub/views/order%20list/basket_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List listTags = ['All', 'Salad Combo', 'Berry Combo', 'Mango Berry'];

  ValueNotifier<int> typePlate = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        final confirmaSair = alertDialogPattern(context, 'Go out', 'Do you really want to go out?', exitMode: true);
        return confirmaSair;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02, left: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: SvgPicture.asset('assets/images/Menu.svg'),
                            onTap: () {},
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Welcome, ${IniLocal.readString('Login', 'User name')}',
                            style: const TextStyle(fontSize: 14, color: Palette.darkPurple, fontFamily: 'TTNorms_Medium'),
                          ),
                        ],
                      ),
                      CircularButton(
                        icon: SvgPicture.asset('assets/images/Shop.svg', fit: BoxFit.scaleDown),
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
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04, bottom: 18, left: 24, right: 24),
                  child: const SearchBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 30),
                  child: LoaderTags(tags: listTags, height: 50),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Recommended Combo',
                            style: TextStyle(
                              fontSize: 18,
                              color: Palette.darkPurple,
                              fontFamily: 'TTNorms_Medium',
                            ),
                          ),
                          DividerPattern(width: 60),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        bottom: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: const LoaderCards(assetJson: 'assets/mocks/mock_plates_recommended.json'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: typePlate,
                            builder: (context, value, child) => Row(
                              children: [
                                ToggleOptionText(title: 'Hottest', index: 0, typePlate: typePlate),
                                ToggleOptionText(title: 'Popular', index: 1, typePlate: typePlate),
                                ToggleOptionText(title: 'New Combo', index: 2, typePlate: typePlate),
                              ],
                            ),
                          ),
                          const DividerPattern(width: 40),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: const LoaderCards(assetJson: 'assets/mocks/mock_plates.json'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
