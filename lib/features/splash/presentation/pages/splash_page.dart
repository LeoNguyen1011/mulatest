import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/local_data/sp_keys.dart';
import 'package:mula_biz_mobile/features/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  getLocalStorageData() async {
    var data = await LocalStorageImpl().get(SPKeys.deviceId.name);
    return data;
  }

  bool isAccountActivated = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var data = await getLocalStorageData();
      if (data != null) {
        setState(() {
          isAccountActivated = true;
        });
      } else {
        setState(() {
          isAccountActivated = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Future.delayed(
            const Duration(seconds: 3),
            () => {
                  if (isAccountActivated)
                    {context.pushReplacementNamed(Routes.signIn)}
                  else
                    {context.pushReplacementNamed(Routes.accountActivationPage)}
                });
      },
      builder: (_, __) {
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Assets.svg.gradientBgr.svg(
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Assets.svg.logoLanscape
                  .svg(fit: BoxFit.contain, width: 228.w, height: 113.h),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 82),
                  child: Text(
                    'No Credit, Think Mula.',
                    style: AppTypo.heading3.copyWith(color: AppColors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
