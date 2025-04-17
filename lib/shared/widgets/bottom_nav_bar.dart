import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkhub/screens/home_screen.dart';
import 'package:linkhub/screens/my_network_screen.dart';
import 'package:linkhub/screens/screens.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key,this.selectedItemColor});
  static int index = 0;
  Color? selectedItemColor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        backgroundColor: colornav,
      
        selectedItemColor: selectedItemColor ?? color4,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: ''),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.globe), label: ''),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userGroup),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user), label: ''),
        ],
        currentIndex: index,
      
        onTap: (value) {
          // Handle navigation logic here
          if (value == 0) {
            index = value;
            goto(context, HomeScreen());
            
            // Navigate to Home Screen
          } else if (value == 1) {
            index = value;
            goto(context, MyNetworkScreen());
             // Navigate to Network Screen
          } else if (value == 2) {
            index = value;
            goto(context, GroupScreen());
            // Navigate to My Network Screen
          } else if (value == 3) {
            index = value;
            goto(context, ProfileScreen());
            // Navigate to Profile Screen
          }
        },
      ),
    );
  }
}
