import 'package:flutter/material.dart';
import 'package:fruit_hub/views/home/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: const [], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
      },
      home: const HomeView(),
    );
  }
}
