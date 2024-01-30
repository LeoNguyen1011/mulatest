import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state == AuthState.unauthenticated()) {
          context.go(Routes.signIn);
        }
      },
      child: Column(
        children: [
          _listTile(
              title: LocaleKeys.inviteUser.tr(),
              onTap: () {
                context.pushNamed(Routes.inviteUserScreen);
              }),
          _listTile(
            title: LocaleKeys.settings.tr(),
            trailingWidget: Assets.svg.settings.svg(),
            onTap: () {
              context.pushNamed(Routes.settingsScreen);
            },
          ),
          _listTile(title: LocaleKeys.securitySettings.tr()),
          _listTile(title: LocaleKeys.deviceManagement.tr()),
          _listTile(title: LocaleKeys.consentManagement.tr()),
          _listTile(title: LocaleKeys.aboutMULA.tr()),
          const SizedBox(
            height: 96,
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthBloc>().add(
                    const AuthEvent.logout(),
                  );
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.colorD2DAE2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    40,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  LocaleKeys.signOut.tr(),
                  style: AppTypo.heading5.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listTile(
      {required String title, Widget? trailingWidget, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.colorD2DAE2))),
        child: ListTile(
          title: Text(
            title,
            style: AppTypo.bodySmall,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingWidget != null) trailingWidget,
              Assets.svg.arrowRight.svg()
            ],
          ),
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
