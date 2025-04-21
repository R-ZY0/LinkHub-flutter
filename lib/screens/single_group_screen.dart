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
      appBar: AppBar(
        title: Text('Single Group'),
        leading: MyBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/mj.jpg')),
            ),
            SizedBox(height: 10),
            Text(
              'Group Members',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: color4,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
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
                itemCount: 15, // Replace with the actual number of members
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedItemColor: Colors.grey,
      ),
    );
  }
}