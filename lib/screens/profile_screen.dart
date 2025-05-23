//abdo
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/themes/colors.dart';
import 'widgets/screens_widgrts.dart';

// Profile Screen widget
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Phone number URI to make calls
  final Uri phoneNumber = Uri.parse('tel:+201288220410');

  // Map containing various social media and contact links
  final Map myContacts = {
    'whatsapp': Uri.parse('https://wa.me/201015286683'),
    'facebook': Uri.parse('https://www.facebook.com/profile.php?id=100078818844136'),
    'youtube': Uri.parse('https://youtu.be/PfUDT5LOKUE?si=Z3Eli4PuFKtkpPok'),
    'github': Uri.parse('https://github.com/R-ZY0'),
    'linkedin': Uri.parse('https://www.linkedin.com/in/mohammed-ramzi'),
    'pinterest': Uri.parse('https://pin.it/5P0ikG3X4'),
    'snapchat': Uri.parse('https://www.snapchat.com/'),
    'instagram': Uri.parse('https://www.instagram.com/abdelrahman_adel745/'),
    'x': Uri.parse('https://x.com/x'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: MyBackButton(), // Custom back button
      ),
    
      // Main Body
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                // Profile picture
                CircleAvatar(
                  backgroundImage: AssetImage('assets/f1.jpg'),
                  radius: 100,
                ),
    
                SizedBox(height: 15),
    
                // Profile name
                Text(
                  'Mohamed Ramzy',
                  style: textStyleWhiteBold.merge(
                    TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
    
                SizedBox(height: 10),
    
                // Edit and Delete buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit Profile button
                    ActionButton(
                      title: 'Edit Profile',
                      action: () {
                        print("Edit profile clicked");
                      },
                      buttonColor: Colors.black,
                    ),
    
                    SizedBox(width: 10),
    
                    // Delete Profile button with confirmation dialog
                    ActionButton(
                      title: 'Delete Profile',
                      action: () {
                        AwesomeDialog(
                          titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Delete Profile',
                          desc: 'Are you sure you want to delete your profile?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                      },
                      buttonColor: Colors.red,
                    ),
                  ],
                ),
    
                SizedBox(height: 5),
    
                // Phone number with call button
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
                        launchUrl(phoneNumber); // Launch phone dialer
                      },
                      icon: Icon(Icons.phone),
                      iconSize: 30,
                      color: Color.fromARGB(255, 125, 125, 125),
                    ),
                  ],
                ),
    
                SizedBox(height: 20),
    
                // GridView for social media links
                GridView.builder(
                  itemCount: myContacts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return ContactChanelCard(
                      platform: myContacts.keys.toList()[index],
                      url: myContacts.values.toList()[index],
                    );
                  },
                  physics: NeverScrollableScrollPhysics(), // No scrolling inside GridView
                  shrinkWrap: true, // Take minimum space
                  primary: false,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    
      // Bottom navigation bar
      bottomNavigationBar: BottomNavBar(),
    
      // Extend body for transparent nav bar design
      extendBody: true,
    );
  }
}
