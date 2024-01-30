import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/common/app_theme/app_theme.dart';
import 'package:mula_biz_mobile/common/constants.dart';
import 'package:mula_biz_mobile/common/logger/bloc_logger.dart';
import 'package:mula_biz_mobile/common/multi_languages/localize_helper.dart';
import 'package:mula_biz_mobile/di/di_setup.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mula_biz_mobile/features/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'common/config/screen_utils_config.dart';
import 'routes/app_pages.dart';

String envConfig(String flavor) {
  switch (flavor) {
    case 'dev':
      return 'assets/env/.env_dev';
    case 'staging':
      return 'assets/env/.env_staging';
    case 'production':
      return 'assets/env/.env_production';
    case 'newDev':
      return 'assets/env/.env_dev';
    default:
      return 'assets/env/.env_dev';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) Bloc.observer = AppBlocObserver();
  const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
  log("flavor: $flavor");
  await dotenv.load(
    fileName: envConfig(flavor),
  );
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  // await Firebase.initializeApp();
  // await getIt<PushNotificationHelper>().initialize();
  // await getIt<LocalNotificationHelper>().init();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        LocalizationConstants.enUSLocale,
        LocalizationConstants.thTHLocale,
      ],
      path: LocalizationConstants.path,
      fallbackLocale: LocalizationConstants.enUSLocale,
      child: const MulaBizApp(),
    ),
  );
}

class MulaBizApp extends StatefulWidget {
  const MulaBizApp({Key? key}) : super(key: key);

  @override
  State<MulaBizApp> createState() => _MulaBizAppState();
}

class _MulaBizAppState extends State<MulaBizApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (context.locale == LocalizationConstants.enUSLocale) {
        LocalizeHelper.saveCurrentLanguage("en");
      } else {
        LocalizeHelper.saveCurrentLanguage("th");
      }
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>()..add(const AuthEvent.init()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          ScreenUtilsConfig.designWidth,
          ScreenUtilsConfig.designHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppThemes.light,
            routerConfig: getIt<AppPages>().router,
          );
        },
      ),
    );
  }
}
