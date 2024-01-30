import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/utils/encryption_helper.dart';
import 'package:mula_biz_mobile/common/widgets/setup_pin_page.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/cubit/account_activation_cubit.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class AccountActivationCornfirmPinPage extends StatefulWidget {
  const AccountActivationCornfirmPinPage({super.key, required this.pinHasSet});

  final String pinHasSet;

  @override
  State<AccountActivationCornfirmPinPage> createState() =>
      _AccountActivationCornfirmPinPageState();
}

class _AccountActivationCornfirmPinPageState
    extends State<AccountActivationCornfirmPinPage> {
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
        onCompleted: (val) async {
          if (_formKey.currentState?.validate() ?? false) {
            AccountActivationCubit().updateRegistrationEntity(
              pin: await encryptPIN(val),
            );
            // ignore: use_build_context_synchronously
            context.pushNamed(Routes.takeASelfie, extra: () {
              context.pushNamed(Routes.accountActivationFaceScanPage);
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
