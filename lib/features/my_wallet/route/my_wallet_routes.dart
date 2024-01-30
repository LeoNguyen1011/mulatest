import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/features/my_wallet/cubit/my_wallet_cubit.dart';
import 'package:mula_biz_mobile/features/my_wallet/ui/my_wallet_page.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class MyWalletRoutes {
  GoRoute get route => GoRoute(
        name: Routes.myWalletPage,
        path: Routes.myWalletPage,
        builder: (context, state) => BlocProvider(
          create: (context) => MyWalletCubit(),
          child: const MyWalletPage(),
        ),
      );
}
