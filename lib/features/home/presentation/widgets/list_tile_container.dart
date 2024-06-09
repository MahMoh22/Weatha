import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_weather/core/theming/colors.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';

class ListTileContainer extends StatelessWidget {
  const ListTileContainer({
    super.key,
    required this.image,
    required this.title,
    required this.trailing,
    this.isTop = false,
  });
  final String image;
  final String title;
  final String trailing;
  final bool isTop;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorManager.white.withOpacity(0.5),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          image,
          width: 32.w,
          alignment: isTop ? const Alignment(-12, -12) : Alignment.topCenter,
          fit: BoxFit.cover,
        ),
        title: Text(
          title,
          style: TextStyles.font8LightBlack400,
        ),
        trailing: Text(
          trailing,
          style: TextStyles.font8LightBlack400,
        ),
        contentPadding:
            EdgeInsets.only(left: 4.w, right: 20.w, top: 2.h, bottom: 2.h),
        horizontalTitleGap: 2.w,
        minLeadingWidth: 0.w,
        visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
      ),
    );
  }
}
