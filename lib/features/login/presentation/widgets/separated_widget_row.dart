import 'package:flutter/material.dart';
import 'package:project/core/colors_app.dart';

class SeparatedWidgetDeviderAndText extends StatelessWidget {
  const SeparatedWidgetDeviderAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: ColorApp.hint,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 5, left: 5),
          child: Text(
            'or',
            style: TextStyle(fontSize: 15, color: ColorApp.hint),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: ColorApp.hint,
          ),
        )
      ],
    );
  }
}
