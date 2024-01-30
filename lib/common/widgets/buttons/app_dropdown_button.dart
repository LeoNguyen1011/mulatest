import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/index.dart';

class AppDropdownButton<T> extends StatefulWidget {
  const AppDropdownButton({
    Key? key,
    required this.items,
    required this.initValue,
    this.hintWidget,
    this.width = double.infinity,
    this.height = 32,
  }) : super(key: key);

  final List<T> items;
  final T initValue;
  final Widget? hintWidget;
  final double width;
  final double height;

  @override
  State<AppDropdownButton<T>> createState() => _AppDropdownButtonState<T>();
}

class _AppDropdownButtonState<T> extends State<AppDropdownButton<T>> {
  T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<T>(
      items: widget.items.map((e) {
        return DropdownMenuItem<T>(
          value: e,
          child: (e is DropdownWidgetViewModel)
              ? SizedBox(
                  width: 25,
                  height: 15,
                  child: e.widget,
                )
              : Text(
                  e.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
        );
      }).toList(),
      value: value,
      onChanged: (val) {
        setState(() {
          value = val;
        });
      },
      isExpanded: true,
      hint: widget.hintWidget,
      underline: const SizedBox(),
      style: AppTypo.bodyTiny,
      buttonStyleData: _buttonStyle(),
      iconStyleData: _trailingIconStyle(),
      dropdownStyleData: _dropdownStyle(),
      menuItemStyleData: _menuItemStyle(),
    );
  }

  MenuItemStyleData _menuItemStyle() {
    return MenuItemStyleData(
      height: widget.height,
      padding: const EdgeInsets.only(left: 8, right: 8),
    );
  }

  DropdownStyleData _dropdownStyle() {
    return DropdownStyleData(
      maxHeight: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      offset: const Offset(0, -4),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(40),
        thickness: MaterialStateProperty.all(6),
        thumbVisibility: MaterialStateProperty.all(true),
      ),
      elevation: 2,
    );
  }

  IconStyleData _trailingIconStyle() {
    return IconStyleData(
      icon: const Icon(Icons.keyboard_arrow_down),
      iconDisabledColor: const Color.fromARGB(255, 183, 141, 141),
      iconEnabledColor: Colors.grey[500]!,
    );
  }

  ButtonStyleData _buttonStyle() {
    return ButtonStyleData(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.grey[400]!,
        ),
      ),
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.only(left: 8, right: 4),
    );
  }
}

class DropdownWidgetViewModel {
  final String value;
  final Widget widget;

  const DropdownWidgetViewModel({required this.value, required this.widget});
}
