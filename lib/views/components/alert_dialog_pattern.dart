import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/shared/palette.dart';

alertDialogPattern(context, String title, String content, {bool? exitMode = false}) {
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
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'TTNorms_Medium',
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(
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
                'Cancel',
                style: TextStyle(
                  fontSize: 15,
                  color: Palette.orange,
                  fontFamily: 'TTNorms_Medium',
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                exitMode! ? SystemNavigator.pop() : null;
                Navigator.pop(context, true);
              },
              child: const Text(
                'Confirm',
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
