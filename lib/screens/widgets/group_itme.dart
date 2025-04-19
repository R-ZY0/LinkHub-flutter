import 'package:flutter/material.dart';
import 'package:linkhub/screens/single_group_screen.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goto(context, SingleGroupScreen());
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
                image: AssetImage('assets/mj.jpg'),
                fit: BoxFit.fill,       
              ),
              borderRadius: BorderRadius.circular(39),
            ),
          ),
          Center(
            child: Text(
              'Group Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color4,
              ),
            ),
          )
        ],
      ),
    );
  }
}