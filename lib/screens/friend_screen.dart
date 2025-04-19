import 'package:flutter/material.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';
import 'widgets/screens_widgrts.dart';

class FriendScreen extends StatelessWidget {
  FriendScreen({super.key});

  final Uri phoneNumber = Uri.parse('tel:+201288220410');

  final Map myContacts = {
    'whatsapp': Uri.parse('https://wa.me/201015286683'),
    'facebook': Uri.parse(
      'https://www.facebook.com/profile.php?id=100078818844136',
    ),
    'youtube': Uri.parse('https://youtu.be/PfUDT5LOKUE?si=Z3Eli4PuFKtkpPok'),
    'github': Uri.parse('https://github.com/R-ZY0'),
    'linkedin': Uri.parse('www.linkedin.com/in/mohammed-ramzi'),
    'pinterest': Uri.parse('https://pin.it/5P0ikG3X4'),
    'snapchat': Uri.parse('https://www.snapchat.com/'),
    'instagram': Uri.parse('https://www.instagram.com/abdelrahman_adel745/'),
    'x': Uri.parse('https://x.com/x'),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(title: Text('friend')
        
        ,leading: MyBackButton()),

        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/f1.jpg'),
                    radius: 100,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Mohamed Ramzy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  ActionButtonWithIcon(
                    title: 'Add to a groub',
                    
                    icon: Icons.add,
                    buttonColor: color2,
                    action: () {
                      showModalBottomSheet<void>(
                        backgroundColor: transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: color3,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            height: 300,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Container(
                                        width: 75,
                                        height: 12,
                                    
                                        decoration: BoxDecoration(
                                          color: color8,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(9),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:12.0,left: 16),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              TextButton(onPressed: () {} , child: Text('Work',style: textStyleWhiteBold.merge(TextStyle(fontSize: 25)),),),
                                              SizedBox(height: 16,),
                                              
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      print("frind added to a groub");
                    },
                  ),
                  SizedBox(height: 5),
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
                          launchUrl(phoneNumber);
                        },
                        icon: Icon(Icons.phone),
                        iconSize: 30,
                        color: Color.fromARGB(255, 125, 125, 125),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    itemCount: myContacts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
        bottomNavigationBar: BottomNavBar(selectedItemColor: Colors.grey,),
        extendBody: true,
      ),
    );
  }
}