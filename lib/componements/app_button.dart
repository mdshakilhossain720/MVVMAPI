import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_text_style.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.width = double.infinity,
    this.height,
    this.buttonColor,
    required this.title,
    this.onTap,
    this.titleColor,
    this.textPaddingHorizontal,
    this.textPaddingVertical,
    this.icon,
    this.showLoading = false,
  });
  final double? width;
  final double? height, textPaddingHorizontal, textPaddingVertical;
  final Color? buttonColor;
  final String title;
  final Color? titleColor;
  final Widget? icon;
  final bool? showLoading;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle(context);
    return FilledButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? Color(0xFF8500FA),
        disabledBackgroundColor: buttonColor?.withOpacity(.2) ??
            Color(0xFF8500FA).withOpacity(.2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.h))),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: textPaddingHorizontal ?? 0.h,
              vertical: textPaddingVertical ?? 0.h),
          child: showLoading!
              ? SizedBox(
                  width: 18.h,
                  height: 18.h,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF306AFF)),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textStyle.bodyTextSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: titleColor ?? Color(0xff617986)
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (icon != null)
                    icon != null ? icon! : const SizedBox(),
                  ],
                ),
        ),
      ),
    );
  }
}

class AppTextShrinkButton extends StatelessWidget {
  const AppTextShrinkButton({
    super.key,
    this.buttonColor,
    required this.title,
    this.onTap,
    this.titleColor,
  });

  final Color? buttonColor;
  final String title;
  final Color? titleColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: buttonColor ?? Color(0xFF8500FA),
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: textStyle.bodyText.copyWith(
                fontWeight: FontWeight.bold,
                color: titleColor ?? Color(0xffffffff),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
           
            Icon(
              Icons.arrow_forward_ios,
              size: 20.r,
              color: titleColor ?? Color(0xffffffff),
            )
          ],
        ),
      ),
    );
  }
}
