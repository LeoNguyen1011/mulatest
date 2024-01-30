import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/common/utils/dialog/dialog_service.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/features/registration/change_device/cubit/change_device_cubit.dart';
import 'package:mula_biz_mobile/features/registration/widgets/face_scan_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class ChangeDeviceFaceScanPage extends StatelessWidget {
  const ChangeDeviceFaceScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeDeviceCubit, ChangeDeviceState>(
      listenWhen: (previous, current) =>
          previous.faceDetectStatus != current.faceDetectStatus,
      listener: (context, state) {
        if (state.faceDetectStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.faceDetectStatus.success) {
          context.pushNamed(Routes.changeDeviceConfirmOtp);
        } else if (state.faceDetectStatus.failed) {
          context.pop(context);
          context.pop(context);
          context.pop(context);
          context.pop(context);
          AppToast.showToast(state.checkFaceStatusErrorMsg);
        }
      },
      child: FaceScanPage(onSuccess: (val) {
        context.read<ChangeDeviceCubit>().onChangeDevice(faceImage: val);
      }),
    );
  }
}
