import 'package:flutter/material.dart';

import 'auth/registration.dart';
import 'new_payment/payment.dart';
import 'payment/payment_screen.dart';
import 'video_player/video_player.dart';

class AllRouteScreen extends StatelessWidget {
  const AllRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Route'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const PaymentScreen(),));
            }, child: Text("Payment Screen"))),
            SizedBox(
            height: 10,),
            SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
            }, child: Text("Regestrion Screen"))),
            SizedBox(
            height: 10,),
            SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text("Login Screen"))),
            SizedBox(
            height: 10,),
            SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>  PaymentScreenNew (),));
            }, child: Text("Payment Screen New"))),
            SizedBox(
            height: 10,),
            SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => PalyWidget  (),));
            }, child: Text("Video Player"))),
        ],
      ),
    );
  }
}
