import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/pages/home/ui/widgets/my_text.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: 'Category',
            size: Dimensions.font16,
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CategoryIconText(
                  label: 'Apparel',
                  icon: 'assets/icons/shoe 4.svg',
                ),
                CategoryIconText(
                  label: 'School',
                  icon: 'assets/icons/shoe 2.svg',
                ),
                CategoryIconText(
                  label: 'Sports',
                  icon: 'assets/icons/shoe 3.svg',
                ),
                CategoryIconText(
                  label: 'Party',
                  icon: 'assets/icons/shoe 1.svg',
                ),
                CategoryIconText(
                  label: 'All',
                  icon: 'assets/icons/all.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIconText extends StatelessWidget {
  const CategoryIconText({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);
  final String label;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimensions.height5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius8),
              color: AppColors.main.withOpacity(.2),
            ),
            child: SvgPicture.asset(
              icon,
              height: Dimensions.height40,
              width: Dimensions.width40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: Dimensions.height5,
          ),
          MyText(
            text: label,
            size: Dimensions.font14,
            color: AppColors.secondary,
          )
        ],
      ),
    );
  }
}
