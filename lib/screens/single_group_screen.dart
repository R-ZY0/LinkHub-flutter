import 'package:flutter/material.dart';
import 'package:linkhub/screens/my_network_screen.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';

class SingleGroupScreen extends StatelessWidget {
  const SingleGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Group'),
       leading: MyBackButton(),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/mj.jpg'))),
            SizedBox(height: 10),
            Text('Group Members',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: color4,
                )),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                                children: [
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                  ContactCard(),
                                  SizedBox(height: 20),
                                ],
                              ),
                  ),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedItemColor: Colors.grey,),
    );
  }
}