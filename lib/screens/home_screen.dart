import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Home"),
        automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(
                  
                    builder: (context, setState) => TextFormField(
                      keyboardType: TextInputType.number, // Numeric keyboard
                     
                      
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return 'Please enter a valid phone number (numbers only)';
                        }
                        return null;
                      },
                      cursorColor: color4,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color4),
                        ),
                        label: Text(
                          "Enter the phone number ",
                          style: TextStyle(color: color4),
                        ),
                        prefixIcon: Icon(Icons.phone, color: color4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color3),
                        ),
                      ),
                      style: textStyleBlackNormal.merge(
                        TextStyle(color: color4),
                      ),
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
      ),
    );
  }
}