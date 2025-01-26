import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTextStyle {
  final BuildContext context;
  AppTextStyle(this.context);

  TextStyle get title => TextStyle(
       
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      );
  TextStyle get subTitle => TextStyle(
      
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      );
  TextStyle get bodyText => TextStyle(
       
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
      );
  TextStyle get bodyTextSmall => TextStyle(
        
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      );
  TextStyle get buttonText => TextStyle(
       
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
      );
  TextStyle get hintText => TextStyle(
        
        fontSize: 21.sp,
        fontWeight: FontWeight.w300,
      );
  TextStyle get appBarText => TextStyle(
       
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      );
}
