import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> list = <String>['Eng', 'Thai'];
  String dropdownValue = '';

  @override
  void initState() {
    dropdownValue = list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBar(
        title: LocaleKeys.settings.tr(),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) async {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });

              if (value == "Eng") {
                context.setLocale(LocalizationConstants.enUSLocale);
                LocalizeHelper.saveCurrentLanguage("en");
              } else {
                context.setLocale(LocalizationConstants.thTHLocale);
                LocalizeHelper.saveCurrentLanguage("th");
              }
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
