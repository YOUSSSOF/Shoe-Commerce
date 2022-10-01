import 'package:flutter/cupertino.dart';

import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/utils/dimesions.dart';

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.text,
    this.color = AppColors.text1Color,
    this.size = 0,
    this.weight = FontWeight.w400,
    this.textOverflow,
    this.lineHeight,
  }) : super(key: key);
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? textOverflow;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.font12 : size,
        fontWeight: weight,
        color: color,
        height: lineHeight,
      ),
    );
  }
}
