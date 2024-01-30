import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/features/core/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mula_biz_mobile/features/main_page/home/ui/home_screen.dart';
import 'package:mula_biz_mobile/features/main_page/more/more_screen.dart';
import 'package:mula_biz_mobile/features/main_page/ui/app_bar_for_main_page.dart';
import 'package:mula_biz_mobile/features/main_page/ui/bottom_app_bar.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _listTabs = [
    const HomeScreen(),
    const Text("Dashboard"),
    const Text("Scan"),
    const Text("Breft"),
    const MoreScreen(),
  ];

  @override
  void initState() {
    context.read<AuthBloc>().add(
          const AuthEvent.getUserProfile(),
        );
    super.initState();

    _tabController = TabController(length: _listTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarForMainPage(),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: _listTabs,
              ),
            )
          ],
        ),
      ),
      bottomNavigation: AppBottomAppBar(
        controller: _tabController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.burgundy,
        child: Assets.svg.headphone.svg(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
