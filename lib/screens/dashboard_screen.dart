import 'package:flutter/cupertino.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/screens/account_profile_screen.dart';
import 'package:estate2/screens/favourite_screen.dart';
import 'package:estate2/screens/home_screen.dart';
import 'package:estate2/screens/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      HomeScreen(),
      SearchResultsPage(),
      FavoritesScreen(),
      AccountProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          activeColorPrimary: AppColors.textPrimary,
          inactiveColorPrimary: Color(0xffA0A2AF)),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.search),
          activeColorPrimary: AppColors.textPrimary,
          inactiveColorPrimary: Color(0xffA0A2AF)),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.heart),
          activeColorPrimary: AppColors.textPrimary,
          inactiveColorPrimary: Color(0xffA0A2AF)),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person),
          activeColorPrimary: AppColors.textPrimary,
          inactiveColorPrimary: Color(0xffA0A2AF)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreen(),
      items: _navBarItems(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.whiteColor,
    );
  }
}
