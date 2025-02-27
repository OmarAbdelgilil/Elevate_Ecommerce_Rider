import 'package:elevate_ecommerce_driver/core/providers/location_provider.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../mian_lay_out_view_model/mian_lay_out_view_model.dart';

class MainLayOutScreen extends StatelessWidget {
  const MainLayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainLayoutViewModel(),
      child: const _MainLayoutBody(),
    );
  }
}

class _MainLayoutBody extends StatelessWidget {
  const _MainLayoutBody();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainLayoutViewModel>();

    return Scaffold(
      body: viewModel.currentScreen,
      bottomNavigationBar: _MainBottomNavigationBar(),
    );
  }
}

class _MainBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocationProvider().startLocationStream();
    final viewModel = context.watch<MainLayoutViewModel>();
    final selectedIndex = viewModel.selectedIndex;
    final tabs = viewModel.tabs;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: List.generate(tabs.length, (index) {
        return BottomNavigationBarItem(
          icon: SvgPicture.asset(
            tabs[index].icon,
            colorFilter: selectedIndex == index
                ? const ColorFilter.mode(ColorManager.primary, BlendMode.srcIn)
                : const ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
            width: AppSize.s28,
          ),
          label: tabs[index].label,
        );
      }),
      currentIndex: selectedIndex,
      onTap: viewModel.onItemTapped,
      backgroundColor: ColorManager.white,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.grey,
      iconSize: AppSize.s28,
      elevation: AppSize.s0,
    );
  }
}
