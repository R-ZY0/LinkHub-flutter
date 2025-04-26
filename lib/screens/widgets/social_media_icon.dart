import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ContactChanelCard displays a clickable icon for a social media platform
class ContactChanelCard extends StatelessWidget {
  // Platform name (used for image asset lookup)
  final String platform;

  // URL to open when the card is tapped
  final Uri url;

  // Constructor with required parameters
  ContactChanelCard({
    Key? key,
    required this.platform,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Material widget for elevation and ripple effect
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50), // Rounded shape
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4, // Shadow effect
          
          child: InkWell(
            onTap: () async {
              // Open the URL externally when tapped
              await launchUrl(url, mode: LaunchMode.externalApplication);
            },
            child: Image(
              image: AssetImage(
                'assets/$platform.png', // Platform-specific icon
              ),
              height: 80,
              width: 80,
              fit: BoxFit.cover, // Cover the available space nicely
            ),
          ),
        ),
      ],
    );
  }
}
