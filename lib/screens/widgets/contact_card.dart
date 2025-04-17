import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/text.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/f1.jpg')),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mohamed Ramzy", style: textTheme1.copyWith(fontSize: 20)),
            Text(
              "+201015286683",
              style: textTheme1.merge(TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ],
    );
  }
}