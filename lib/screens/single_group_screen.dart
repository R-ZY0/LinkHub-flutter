import 'package:flutter/material.dart';
import 'package:linkhub/screens/my_network_screen.dart';
import 'package:linkhub/screens/widgets/contact_card.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';

class SingleGroupScreen extends StatelessWidget {
  const SingleGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with custom back button and title
      appBar: AppBar(
        title: Text('Single Group'),
        leading: MyBackButton(),
      ),

      // Main body content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Group image with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/mj.jpg')),
            ),
            SizedBox(height: 10),

            // "Group Members" title
            Text(
              'Group Members',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: color4,
              ),
            ),
            SizedBox(height: 20),

            // List of group members
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(), // Smooth scrolling
                itemBuilder: (context, index) {
                  return ContactCard(); // Display a contact card for each member
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: color3,   // Divider color between items
                    thickness: 1.5, // Divider thickness
                    height: 20,     // Space between dividers
                  );
                },
                itemCount: 15, // TODO: Replace with dynamic member count
              ),
            ),
          ],
        ),
      ),

      // Custom bottom navigation bar
      bottomNavigationBar: BottomNavBar(
        selectedItemColor: Colors.grey,
      ),
    );
  }
}
