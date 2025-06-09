import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vardhman_creation/controllers/home_controller.dart';
import 'package:vardhman_creation/screens/cart_screen.dart';
import 'package:vardhman_creation/screens/home_screen.dart';
import 'package:vardhman_creation/screens/profile_screen.dart';
import 'package:vardhman_creation/screens/wishlist_screen.dart';
import 'package:vardhman_creation/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.selected)) {
            // Selected label color
            return TextStyle(color: blackColor); // Unselected label color
          }
          return TextStyle(color: bottomNavTextColor);
        }),
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              homeController.currentPage.value = index;
            });
          },
          indicatorColor: buttonBg.withValues(alpha: .8),
          selectedIndex: homeController.currentPage.value,
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset("assets/icons/home_icon.svg"),
              label: 'Home',
            ),
            NavigationDestination(
              icon: SvgPicture.asset("assets/icons/heart_icon.svg"),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: SvgPicture.asset("assets/icons/cart_icon.svg"),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: SvgPicture.asset("assets/icons/profile_icon.svg"),
              label: 'Profile',
            ),
          ],
        ),
        body:
            [
              HomePageScreen(),
              WishlistScreen(),
              CartScreen(),
              ProfileScreen(),
            ][homeController.currentPage.value],
      ),
    );
  }
}
