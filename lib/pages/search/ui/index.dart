import 'package:badges/badges.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/network/models/shoe.dart';
import 'package:ecommerce/pages/cart/controllers/cart_controller.dart';
import 'package:ecommerce/pages/home/ui/widgets/my_text.dart';
import 'package:ecommerce/pages/home/ui/widgets/recent_products.dart';
import 'package:ecommerce/pages/home/ui/widgets/search_box.dart';
import 'package:ecommerce/pages/search/controllers/search_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.height20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: Get.width / 1.5,
                        child: SearchBox(
                          controller: controller.searchController,
                          onSearch: controller.onSearch,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Get.toNamed(Routes.cart),
                        icon: Badge(
                          badgeContent: Obx(
                            () => MyText(
                              text: Get.find<CartController>()
                                  .items
                                  .length
                                  .toString(),
                              color: Colors.white,
                            ),
                          ),
                          child: SvgPicture.asset('assets/icons/Buy.svg'),
                        ),
                        iconSize: Dimensions.iconSize26,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1.1,
                ),
                Obx(
                  () => controller.search.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: controller.isLoading.value
                                    ? 'Searching...'
                                    : 'Search result for “${controller.search}”',
                                size: 14,
                              ),
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/Filter.svg',
                                  height: Dimensions.height20,
                                  width: Dimensions.width20,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? SizedBox(
                          width: double.infinity,
                          height: Get.height / 1.5,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.main,
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(Dimensions.height10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.searchedShoes.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: Dimensions.cardHeight,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              Shoe shoe = controller.searchedShoes[index];
                              return ShoeCard(shoe: shoe);
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
