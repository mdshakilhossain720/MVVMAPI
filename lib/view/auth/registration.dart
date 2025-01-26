import 'package:flutter/material.dart';

import '../../componements/custom_form_widgets.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomFormWidget(controller: TextEditingController(),
            label: 'Name',
            
            
            ),
            SizedBox(height: 10,),
            CustomFormWidget(controller: TextEditingController(),
            label: 'Email',),
             SizedBox(height: 10,),
            CustomFormWidget(controller: TextEditingController(),
            label: 'Phone',
            
            ),
             SizedBox(height: 10,),
            CustomFormWidget(controller: TextEditingController(),
            label: 'Password',
            
            ),
             SizedBox(height: 30,),
                    
          ],
        ),
      ),
    );
  }
}
