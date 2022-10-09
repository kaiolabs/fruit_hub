import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/shared/palette.dart';

alertDialogPattern(context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      // animação de entrada
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Sair',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'TTNorms_Medium',
            ),
          ),
          content: const Text(
            'Deseja realmente sair?',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'TTNorms_Medium',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 15,
                  color: Palette.orange,
                  fontFamily: 'TTNorms_Medium',
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                Navigator.pop(context, true);
              },
              child: const Text(
                'Sair',
                style: TextStyle(
                  fontSize: 15,
                  color: Palette.orange,
                  fontFamily: 'TTNorms_Medium',
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
