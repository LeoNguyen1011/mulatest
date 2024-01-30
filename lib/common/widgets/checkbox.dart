import 'package:flutter/material.dart';

import 'package:mula_biz_mobile/common/index.dart';

class AppCheckbox extends StatefulWidget {
  const AppCheckbox({super.key, required this.onCheckPressed});

  final Function(bool val) onCheckPressed;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return AppColors.burgundy;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.onCheckPressed(value);
        });
      },
    );
  }
}
