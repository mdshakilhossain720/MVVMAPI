// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../model/common/master_model.dart';


class PaymentCard extends StatelessWidget {
  final PaymentGateways paymentGateways;
  final bool isActive;
  final void Function()? onTap;
  const PaymentCard({
    Key? key,
    required this.paymentGateways,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            border: Border.all(
                color: isActive
                    ?  Color(0xFF8322FF)
                    : Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(
                     'assets/svg/radio.svg',
                      width: 22.sp,
                      colorFilter: ColorFilter.mode(
                        isActive
                            ?  Color(0xFF8322FF)
                            : Color(0xFFD9D9D9),
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      paymentGateways.name.isNotEmpty
                          ? '${paymentGateways.name[0].toUpperCase()}${paymentGateways.name.substring(1)}'
                          : '',
                      style:TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,)
                    )
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl: paymentGateways.logo,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 80.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
