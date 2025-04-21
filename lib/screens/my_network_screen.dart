import 'package:flutter/material.dart';
import 'package:linkhub/screens/friend_screen.dart';
import 'package:linkhub/screens/widgets/contact_card.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';

class MyNetworkScreen extends StatelessWidget {
  const MyNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Network'),
        leading: MyBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ContactCard();
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: color3, // Customize the divider color
              thickness: 1.5, // Customize the thickness
              height: 20, // Space between items
            );
          },
          itemCount: 10, // Replace with the actual number of contacts
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
    );
  }
}

