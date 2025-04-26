import 'package:flutter/material.dart';
import 'package:linkhub/screens/friend_screen.dart';
import 'package:linkhub/screens/widgets/contact_card.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';

// Screen to display user's network (list of contacts)
class MyNetworkScreen extends StatelessWidget {
  const MyNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and custom back button
      appBar: AppBar(
        title: Text('My Network'),
        leading: MyBackButton(),
      ),

      // Main body content
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(), // Smooth scrolling effect

          // Builds each contact card
          itemBuilder: (context, index) {
            return ContactCard(); // Display a contact card (static for now)
          },

          // Divider between contact cards
          separatorBuilder: (context, index) {
            return Divider(
              color: color3,    // Divider color from theme
              thickness: 1.5,   // Divider thickness
              height: 20,       // Space between items
            );
          },

          itemCount: 10, // Number of contact items (replace with dynamic data later)
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavBar(),

      // Extend body behind bottom navigation bar (for transparency effect)
      extendBody: true,
    );
  }
}
