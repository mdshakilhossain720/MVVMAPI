import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../componements/build_payment_card.dart';
import '../../controllers/common/master_controller.dart';
import '../../misc/misc_controller.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
 ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {

  PaymentType selectedPaymentType = PaymentType.none;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [

           if (selectedPaymentType == PaymentType.online) ...[
                _buildPaymentMethodsWidget()
                // const CircularProgressIndicator(),
              ]
        ],
      ),
    );
  }
  Widget _buildPaymentMethodsWidget() {
  return SizedBox(
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 16.h),
      shrinkWrap: true,
      itemCount: ref
          .read(masterControllerProvider.notifier)
          .materModel
          .data
          .paymentGateways
          .length,
      itemBuilder: (context, index) {
        final paymentMethod = ref
            .read(masterControllerProvider.notifier)
            .materModel
            .data
            .paymentGateways[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: PaymentCard(
            onTap: () {
              ref.read(selectedPayment.notifier).state = paymentMethod.name;
            },
            isActive: ref.watch(selectedPayment) == paymentMethod.name,
            paymentGateways: paymentMethod,
          ),
        );
      },
    ),
  );
}
}



enum PaymentType { cash, online, none }
