import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/textfields/pin_number_field.dart';
import 'package:mula_biz_mobile/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';

class PinNumberField extends StatefulWidget {
  const PinNumberField({
    super.key,
  });

  @override
  State<PinNumberField> createState() => _PinNumberFieldState();
}

class _PinNumberFieldState extends State<PinNumberField> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.failed) {
          if (controller.text.length == 6) {
            Future.delayed(const Duration(seconds: 1), () {
              controller.clear();
              focusNode.requestFocus();
            });
          }
        }
      },
      builder: (context, state) => PinNumberFieldWidget(
        scrollPadding: const EdgeInsets.only(bottom: 220, top: 50),
        focusNode: focusNode,
        controller: controller,
        enabled: true,
        title: LocaleKeys.auth_pin_number.tr(),
        titleStyle: AppTypo.heading7.copyWith(
          color: AppColors.grey[700],
        ),
        onChanged: (value) {
          if (value.length == 6) {
            context.read<SignInCubit>().signIn(pin: value);
          }
        },
      ),
    );
  }
}
