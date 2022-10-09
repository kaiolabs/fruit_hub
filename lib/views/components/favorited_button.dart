import 'package:flutter/material.dart';
import 'package:fruit_hub/shared/palette.dart';

class FavoritedButton extends StatefulWidget {
  ValueNotifier<bool> isFavorited;
  final double size;
  FavoritedButton({super.key, required this.isFavorited, required this.size});

  @override
  State<FavoritedButton> createState() => _FavoritedButtonState();
}

class _FavoritedButtonState extends State<FavoritedButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.isFavorited,
      builder: (context, value, child) => InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        child: Icon(
          (widget.isFavorited.value) ? Icons.favorite : Icons.favorite_border_sharp,
          color: Palette.orange,
          size: widget.size,
        ),
        onTap: () {
          widget.isFavorited.value = !widget.isFavorited.value;
        },
      ),
    );
  }
}
