import 'package:flutter/material.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/components/shared/screen.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/utils/route_name.dart';
import 'package:estate2/screens/profile/edit_profile_screen.dart';
import 'package:estate2/screens/profile/change_password_screen.dart';
import 'package:estate2/screens/profile/settings_screen.dart';

class AccountProfileScreen extends StatelessWidget {
  const AccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Screen(
      isBackButton: false,
      isBottomTab: true,
      child: Column(
        children: [
          Gap(isWidth: false, isHeight: true, height: height * 0.04),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),
                Gap(isWidth: false, isHeight: true, height: height * 0.015),
                Text(
                  "Samer Ali",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  "samer@example.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Gap(isWidth: false, isHeight: true, height: height * 0.04),
          _buildTile(
            context,
            icon: Icons.edit,
            title: "Edit Profile",
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.editProfile);
            },
          ),
          _buildTile(
            context,
            icon: Icons.lock,
            title: "Change Password",
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.changePassword);
            },
          ),
          _buildTile(
            context,
            icon: Icons.settings,
            title: "Settings",
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.settings);
            },
          ),
          _buildTile(
            context,
            icon: Icons.logout,
            title: "Logout",
            color: Colors.red,
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(RoutesName.logout);
              // Add logout logic here
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context,
      {required IconData icon,
        required String title,
        Color color = AppColors.textPrimary,
        required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: color),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}