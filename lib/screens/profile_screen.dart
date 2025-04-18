import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/services.dart';
import '../shared/themes/colors.dart';
import 'screens.dart';
import 'widgets/screens_widgrts.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireBaseServices(). getUser(),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          MyUser user = snapshot.data!;
          return SafeArea(
        bottom: true,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,
        child: Scaffold(
          appBar: AppBar(title: Text('Profile'), leading: MyBackButton()),
      
          body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.imge),
                      radius: 100,
                    ),
                    SizedBox(height: 15),
                    Text(
                      user.name,
                      style: textStyleWhiteBold.merge(TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ActionButton(
                          title: 'Edit Profile',
      
                          action: () {
                            print("Edit profile clicked");
                          },
                          buttonColor: Colors.black,
                        ),
                        SizedBox(width: 10),
                        ActionButton(
                          title: 'Delete Profile', // Corrected parameter name
                          // Removed invalid 'style' parameter
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
                              desc:
                                  'Are you sure you want to delete your profile?',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          },
                          buttonColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.phone,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 125, 125, 125),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            launchUrl(Uri.parse('tel:${user.phone}'));
                          },
                          icon: Icon(Icons.phone),
                          iconSize: 30,
                          color: Color.fromARGB(255, 125, 125, 125),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      itemCount: user.socialMediaPlatforms.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10,
                          ),
                      itemBuilder: (BuildContext context, index) {
                        return ContactChanelCard(
                          platform: user.socialMediaPlatforms.keys.toList()[index],
                          url: user.socialMediaPlatforms.values.toList()[index],
                        );
                      },
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(),
          extendBody: true,
        ),
      );
        } else {
          return Center(child: Text('No data found'));
        }
      },






      
    );
  }
}

