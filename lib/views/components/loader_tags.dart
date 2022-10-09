import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/views/components/chip_pattern.dart';

class LoaderTags extends StatelessWidget {
  final List tags;

  final double height;
  const LoaderTags({
    super.key,
    required this.tags,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (var i = 0; i < tags.length; i++) ChipPattern(text: tags[i]),
        ],
      ),
    );
  }
}
