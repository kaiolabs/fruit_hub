import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/controllers/inicializacao.dart';
import 'package:fruit_hub/controllers/provider_finalize_purchase.dart';
import 'package:fruit_hub/views/home/home_view.dart';
import 'package:fruit_hub/views/order%20complete/order_complete_view.dart';
import 'package:fruit_hub/views/order%20list/basket_view.dart';
import 'package:fruit_hub/views/splash/splash_view.dart';
import 'package:fruit_hub/views/welcome/welcome_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Inicializa.inicializaAplic();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProviderfinalizePurchase()),
  ], child: const MyApp()));
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
        '/': (context) => const SplashView(),
        '/home': (context) => const HomeView(),
        '/welcome': (context) => WelcomeView(),
        '/orderListView': (context) => const OrderListView(),
        '/orderCompleteView': (context) => const OrderCompleteView(),
      },
    );
  }
}
