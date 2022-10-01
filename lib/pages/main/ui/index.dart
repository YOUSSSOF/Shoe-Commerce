import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/pages/home/ui/index.dart';
import 'package:ecommerce/pages/main/controllers/bottom_navigator_controller.dart';
import 'package:ecommerce/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Main extends GetView<BottomNavigatorController> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(
        () => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                right: Dimensions.width20,
                left: Dimensions.width20,
                top: Dimensions.height10,
              ),
              child: IndexedStack(
                index: controller.index.value,
                children: controller.views,
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => SizedBox(
              height: Dimensions.bottomAppBar,
              child: BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: BottomBarIcon(
                      index: 0,
                      currentIndex: controller.index.value,
                      path: 'assets/icons/Home.svg',
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomBarIcon(
                      index: 1,
                      currentIndex: controller.index.value,
                      path: 'assets/icons/Heart.svg',
                    ),
                    label: 'Whishlist',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomBarIcon(
                      index: 2,
                      currentIndex: controller.index.value,
                      path: 'assets/icons/Paper.svg',
                    ),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomBarIcon(
                      index: 3,
                      currentIndex: controller.index.value,
                      path: 'assets/icons/Profile.svg',
                    ),
                    label: 'Account',
                  ),
                ],
                currentIndex: controller.index.value,
                unselectedItemColor: AppColors.secondary,
                selectedItemColor: AppColors.main,
                onTap: controller.changeIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.path,
  }) : super(key: key);

  final int index;
  final int currentIndex;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      child: SvgPicture.asset(
        path,
        color: currentIndex == index ? AppColors.main : AppColors.secondary,
      ),
    );
  }
}
