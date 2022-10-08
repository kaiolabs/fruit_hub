import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/views/components/input_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputField(
            controller: TextEditingController(),
            prefixIcon: Icons.search,
            fontSize: 14,
            borderRadius: 16,
            hintText: 'Search for fruit salad combos',
          ),
        ),
        const SizedBox(width: 4),
        Container(
          height: 55,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFF7F5F5),
          ),
          child: SvgPicture.asset('assets/images/Filter.svg', fit: BoxFit.scaleDown),
        )
      ],
    );
  }
}
