import 'package:flutter/material.dart';
import 'package:linkhub/screens/home_screen.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height:150),
              ClipRRect(
                borderRadius: BorderRadius.circular(64),
                child: Image(image: AssetImage('assets/on3.png')),
              ),
              SizedBox(height: 50),
              Text(
                "My LinkHub app is the \nbest app for connecting \nwith your friends and family",
                style: textTheme1.merge(
                  TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: 
      Padding(
        padding: const EdgeInsets.only(bottom: 16,right: 24),
        child: ActionButton(
          title: 'Start',
          action:
              () {goto(context, HomeScreen());}
        ),
      ),
    );
  }
}