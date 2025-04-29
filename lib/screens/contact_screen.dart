//eleawa
import 'package:flutter/material.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/themes/colors.dart';
import 'widgets/screens_widgrts.dart';

// ContactScreen displays the contact information and social media links
class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  // Phone number URI to launch dialer
  final Uri phoneNumber = Uri.parse('tel:+201288220410');

  // Map of social media platforms with their corresponding URLs
  final Map myContacts = {
    'whatsapp': Uri.parse('https://wa.me/201015286683'),
    'facebook': Uri.parse('https://www.facebook.com/profile.php?id=100078818844136'),
    'youtube': Uri.parse('https://youtu.be/PfUDT5LOKUE?si=Z3Eli4PuFKtkpPok'),
    'github': Uri.parse('https://github.com/R-ZY0'),
    'linkedin': Uri.parse('www.linkedin.com/in/mohammed-ramzi'), // ❗ should fix missing https://
    'pinterest': Uri.parse('https://pin.it/5P0ikG3X4'),
    'snapchat': Uri.parse('https://www.snapchat.com/'),
    'instagram': Uri.parse('https://www.instagram.com/abdelrahman_adel745/'),
    'x': Uri.parse('https://x.com/x'),
  };

  // (Unused getter — can be safely deleted)
  get textTheme1 => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // SafeArea to avoid system UI intrusions (e.g., notch, status bar)
      child: Scaffold(
        appBar: AppBar(
          title: Text('contact'),
          leading: MyBackButton(), // Custom back button
        ),

        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(), // Smooth scroll effect
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/f1.jpg'),
                    radius: 100,
                  ),
                  SizedBox(height: 15),

                  // Name Display
                  Text(
                    'Mohamed Ramzy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),

                  // "Add to my network" Button
                  ActionButtonWithIcon(
                    title: 'Add to my network',
                    icon: Icons.add,
                    action: () {
                      print("contact added"); // You can replace this with a SnackBar for better UX
                    },
                  ),
                  SizedBox(height: 5),

                  // Phone number row + Call Button
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+201015286683',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 125, 125, 125),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          // Launch phone dialer
                          launchUrl(phoneNumber);
                        },
                        icon: Icon(Icons.phone),
                        iconSize: 30,
                        color: Color.fromARGB(255, 125, 125, 125),
                      )
                    ],
                  ),
                  SizedBox(height: 20),

                  // Social Media Links Grid
                  GridView.builder(
                    itemCount: myContacts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 icons per row
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      return ContactChanelCard(
                        platform: myContacts.keys.toList()[index], // Platform name
                        url: myContacts.values.toList()[index],    // Platform URL
                      );
                    },
                    physics: NeverScrollableScrollPhysics(), // Disable GridView's own scroll
                    shrinkWrap: true, // Make GridView adapt to the content height
                    primary: false,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavBar(selectedItemColor: Colors.grey),
        extendBody: true, // Make body extend under the BottomNavBar
      ),
    );
  }
}
