//eleawa
import 'package:flutter/material.dart';
import 'package:linkhub/screens/widgets/group_itme.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';

// GroupScreen is a StatelessWidget that displays a grid of groups
class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a title and a custom back button
      appBar: AppBar(
        title: Text('groups'), 
        leading: MyBackButton(), // Custom back button widget
      ),
      
      // Main body: a scrollable grid of GroupItem widgets
      body: GridView.builder(
        itemCount: 66, // Number of items to display
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemBuilder: (BuildContext context, index) {
          return GroupItem(); // Widget for each group
        },
        physics: BouncingScrollPhysics(), // Makes the scroll bounce at edges (iOS-style)
        padding: const EdgeInsets.all(30), // Padding around the grid
      ),
      
      // Custom bottom navigation bar
      bottomNavigationBar: BottomNavBar(),
      
      // Extend body behind the bottom navigation bar for a better UI effect
      extendBody: true,
    );
  }
}
