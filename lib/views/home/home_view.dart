import 'package:flutter/material.dart';
import 'package:fruit_hub/views/components/alert_dialog_pattern.dart';
import 'package:fruit_hub/views/home/body_home.dart';
import 'package:fruit_hub/views/home/header_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              children: const [
                HeaderHome(),
                BodyHome(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
