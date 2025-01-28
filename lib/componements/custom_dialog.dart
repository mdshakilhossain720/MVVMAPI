// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmapi/config/app_text_style.dart';

import 'custom_button.dart';


class CustomDialog extends StatelessWidget {
  final String assetName;
  final String buttonText;
  final VoidCallback callback;
  final Color? buttonColor;
  final String title;
  final String des;
  const CustomDialog({
    Key? key,
    required this.assetName,
    required this.buttonText,
    required this.callback,
    this.buttonColor,
    required this.title,
    required this.des,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
    
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 32.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(assetName),
           SizedBox(height: 16,),
            Text(
              title,
              style: AppTextStyle(context).subTitle.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 20,),
            Text(
              des,
              textAlign: TextAlign.center,
              style: AppTextStyle(context).bodyText.copyWith(fontSize: 16.sp),
            ),
            SizedBox(height: 20,),
            CustomButton(
              buttonText: buttonText,
              onPressed: callback,
              buttonColor: buttonColor,
            )
          ],
        ),
      ),
    );
  }
}
