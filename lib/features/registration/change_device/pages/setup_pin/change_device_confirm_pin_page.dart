import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/widgets/setup_pin_page.dart';
import 'package:mula_biz_mobile/features/registration/change_device/cubit/change_device_cubit.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ChangeDeviceCornfirmPinPage extends StatefulWidget {
  const ChangeDeviceCornfirmPinPage({super.key, required this.pinHasSet});

  final String pinHasSet;

  @override
  State<ChangeDeviceCornfirmPinPage> createState() =>
      _ChangeDeviceCornfirmPinPageState();
}

class _ChangeDeviceCornfirmPinPageState
    extends State<ChangeDeviceCornfirmPinPage> {
  final TextEditingController textEditingController = TextEditingController();
  String errorText = '';
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SetupPinPage(
        onChanged: (val) {},
        onCompleted: (val) {
          if (_formKey.currentState?.validate() ?? false) {
            ChangeDeviceCubit().updateChangeDevice(pin: val);
            context.pushNamed(Routes.takeASelfie, extra: () {
              context.pushNamed(Routes.changeDeviceFaceScanPage);
            });
          }
        },
        controller: textEditingController,
        validator: (val) {
          if ((val?.length) == 6 && val == widget.pinHasSet) {
            return null;
          } else {
            return LocaleKeys.validators_pin_not_match.tr();
          }
        },
      ),
    );
  }
}
