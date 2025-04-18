import 'package:flutter/material.dart';
import 'package:linkhub/screens/friend_screen.dart';
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

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goto(context, FriendScreen());

      },
      child: Row(
        children: [
          CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/f1.jpg')),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mohamed Ramzy", style: textStyleWhiteBold.copyWith(fontSize: 20)),
              Text(
                "+201015286683",
                style: textStyleWhiteBold.merge(TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
