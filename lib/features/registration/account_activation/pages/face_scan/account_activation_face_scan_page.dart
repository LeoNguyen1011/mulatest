import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/bloc_status.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/features/registration/account_activation/cubit/account_activation_cubit.dart';
import 'package:mula_biz_mobile/features/registration/widgets/face_scan_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class AccountActivationFaceScanPage extends StatelessWidget {
  const AccountActivationFaceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountActivationCubit, AccountActivationState>(
      listenWhen: (prv, curr) =>
          prv.registerFaceStatus != curr.registerFaceStatus,
      listener: (context, state) {
        if (state.registerFaceStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.registerFaceStatus.success) {
          context.pushNamed(Routes.accountActivationConfirmOtpPage);
        } else if (state.registerFaceStatus.failed) {
          AppToast.showToast(state.faceRegisErrorMsg);
          context.pop(context);
          context.pop(context);
          context.pop(context);
          context.pop(context);
        }
      },
      child: FaceScanPage(onSuccess: (val) {
        var imageFile = File(val.path);
        var byte = imageFile.readAsBytesSync();
        String imageConvertBase64 = base64.encode(byte);
        AccountActivationCubit()
            .updateRegistrationEntity(faceImage: imageConvertBase64);
        context.read<AccountActivationCubit>().activateAccount();
      }),
    );
  }
}
