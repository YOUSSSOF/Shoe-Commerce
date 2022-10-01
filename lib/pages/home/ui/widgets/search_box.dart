import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    Key? key,
    this.onSearch,
    this.isEnabled,
    this.controller,
  }) : super(key: key);
  final VoidCallback? onSearch;
  final bool? isEnabled;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.height15, bottom: Dimensions.height15),
      height: Dimensions.searchBoxHeight,
      child: TextField(
        autofocus: true,
        enabled: isEnabled,
        controller: controller,
        onSubmitted: (s) => onSearch!(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
            borderSide: const BorderSide(
              color: Color(0xFFF0F2F1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
            borderSide: const BorderSide(
              color: Color(
                0xFFF0F2F1,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius8),
            borderSide: const BorderSide(
              color: AppColors.main,
            ),
          ),
          hintText: 'Search here ...',
          prefixIcon: IconButton(
            onPressed: null,
            icon: UnconstrainedBox(
              child: SvgPicture.asset(
                'assets/icons/Search.svg',
                height: Dimensions.iconSize24,
                width: Dimensions.iconSize24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
