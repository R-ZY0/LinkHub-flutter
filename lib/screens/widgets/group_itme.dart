import 'package:flutter/material.dart';
import 'package:linkhub/screens/single_group_screen.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';

// GroupItem represents a clickable card for a group
class GroupItem extends StatelessWidget {
  const GroupItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the SingleGroupScreen when the card is tapped
        goto(context, SingleGroupScreen());
      },
      child: Stack(
        children: [
          // Background container with group image
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Dark overlay on image
                  BlendMode.darken,
                ),
                image: AssetImage('assets/mj.jpg'), // Group image
                fit: BoxFit.fill, // Fill the container fully
              ),
              borderRadius: BorderRadius.circular(39), // Rounded corners
            ),
          ),
          // Centered group name text
          Center(
            child: Text(
              'Group Name', // Placeholder for group name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color4, // Text color from shared theme
              ),
            ),
          )
        ],
      ),
    );
  }
}
