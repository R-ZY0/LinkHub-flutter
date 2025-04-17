import 'package:flutter/material.dart';
import 'package:linkhub/screens/widgets/group_itme.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:linkhub/shared/widgets/bottom_nav_bar.dart';
import '../shared/themes/colors.dart';
import '../shared/themes/text.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('groups'),
      leading: MyBackButton(),),
      body: GridView.builder(
                    itemCount: 66,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                         
                         
                        ),
                    itemBuilder: (BuildContext context, index) {
                      return GroupItem();
                    },
                    physics:  BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(30),
                  ),
      bottomNavigationBar: BottomNavBar(),
      extendBody: true,
    );
  }
}