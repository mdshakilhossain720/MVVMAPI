import 'package:flutter/material.dart';

class PaymentScreenNew extends StatefulWidget {
  const PaymentScreenNew({super.key});

  @override
  State<PaymentScreenNew> createState() => _PaymentScreenNewState();
}

class _PaymentScreenNewState extends State<PaymentScreenNew> {
  PaymentType selectedPaymentType = PaymentType.none;
  int? selectedIndex;
  final List<Map<String, dynamic>> paymentMethods = [
    {"name": "Credit Card", "icon": Icons.credit_card},
    {"name": "PayPal", "icon": Icons.account_balance_wallet},
    {"name": "Google Pay", "icon": Icons.payment},
    {"name": "Apple Pay", "icon": Icons.phone_iphone},
    {"name": "Cash on Delivery", "icon": Icons.money},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: paymentMethods.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.blue // Change color when selected
                                  : Colors.black, // Default color
                              width: 2, // Make border more visible
                            ),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       Icon(
                                paymentMethods[index]["icon"],
                                color: selectedIndex == index
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text(paymentMethods[index]["name"],),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                )
                              ])),
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}

enum PaymentType { cash, online, none }
