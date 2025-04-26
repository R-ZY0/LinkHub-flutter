import 'package:flutter/material.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/text.dart';

import '../screens.dart';

// ContactCard represents a clickable user contact item
class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the FriendScreen when the contact card is tapped
        goto(context, FriendScreen());
      },
      child: Row(
        children: [
          // Circular avatar showing the contact's profile picture
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/f1.jpg'),
          ),
          SizedBox(width: 20), // Space between avatar and text
          // Column containing the contact's name and phone number
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start (left)
            children: [
              // Contact's name styled with bold white text
              Text(
                "Mohamed Ramzy",
                style: textStyleWhiteBold.copyWith(fontSize: 20),
              ),
              // Contact's phone number styled with grey color
              Text(
                "+201015286683",
                style: textStyleWhiteBold.merge(
                  TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
