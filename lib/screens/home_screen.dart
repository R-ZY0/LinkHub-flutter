import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Home"), automaticallyImplyLeading: false),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(
                  builder:
                      (context, setState) => TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number, // Numeric keyboard
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Allow only digits
                          LengthLimitingTextInputFormatter(
                            11,
                          ), // Restrict input to 11 digits
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.length != 11) {
                            return 'Phone number must be 11 digits';
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
                ActionButtonWithIconHome(
                  title: "Search",
                  icon: Icons.search,
                  action: () async {
                    final enteredPhoneNumber = phoneNumber.text.trim();

                    if (enteredPhoneNumber.length == 11) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Searching... Please wait.',
                            style: textStyleBlackNormal,
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: color2,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );

                      await Future.delayed(Duration(seconds: 3));

                      final querySnapshot =
                          await _firestore
                              .collection('users')
                              .where('phone', isEqualTo: enteredPhoneNumber)
                              .get();

                      if (querySnapshot.docs.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'User found!',
                              style: textStyleBlackNormal,
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: color2,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );

                        await Future.delayed(Duration(seconds: 1));
                        goto(context, FriendScreen());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Phone number not found in database.',
                              style: textStyleBlackNormal,
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: color2,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please enter a valid 11-digit phone number.',
                            style: textStyleBlackNormal,
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: color2,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }
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
