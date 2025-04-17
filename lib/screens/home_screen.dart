import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';

import 'screens.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
var phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),
      automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: phoneNumber,
                keyboardType: TextInputType.phone,
                cursorColor: color4,
                decoration: InputDecoration(
                  label:Text("Enter the phone number ") ,
                  prefixIcon: Icon(Icons.phone, color: color4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: color4),
                  ),
                ),
                style: textTheme1.merge(
                  TextStyle(color: color4),
                ),
              ),
              SizedBox(height: 30),
              ActionButtonWithIcon(
                title: "Search",
                icon: Icons.search,
                action: () {
                  print("Searching for ${phoneNumber.text}");
                  // goto(context, Onboarding1Screen());
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
    );
  }
}
