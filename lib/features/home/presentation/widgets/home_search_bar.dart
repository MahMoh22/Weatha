import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_weather/core/theming/text_styles_manager.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: Row(
        children: [
          /*SvgPicture.asset(
            'assets/images/searchIc.svg',
            width: 20.w,
          ),
          SizedBox(
            width: 10.w,
          ),*/
          Text(
            title,
            style: TextStyles.font10Gray400,
          ),
        ],
      ),
    );
  }
}
