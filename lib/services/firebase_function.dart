import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkhub/screens/profile_screen.dart';
import 'package:linkhub/services/models.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';

class FireBaseServices {
  var fireStorRef = FirebaseFirestore.instance;
  var userRef = FirebaseFirestore.instance.collection('users');

  // Create a new user with optional GitHub avatar URL
  createNewUser({
    required String uid,
    required String name,
    required String phone,
    context,
    required Map<String, dynamic> socialMediaPlatforms,
     required XFile profileImage, // Added profileImage parameter

  }) async {
    var ref = userRef.doc(uid);

    var user = MyUser(
      name: name,
      phone: phone,
      imge: profileImage?.path ?? "", // Use GitHub avatar if provided, or an empty string
      socialMediaPlatforms: socialMediaPlatforms,
    );

    // Save user data to Firestore
    await ref.set(user.toMap());
    
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'User Created Successfully!',
          style: textStyleBlackNormal,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: color2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    await Future.delayed(Duration(seconds: 2));

    // Navigate to the Profile screen
    goto(context, ProfileScreen());
  }

  // Fetch user by UID (for example, get current user details)
  Future<MyUser> getUser() async {
    var ref = userRef.doc('toe7Jv3B7B8Yr1nYid8W'); // Example UID
    var myData = await ref.get();
    var theTrueData = MyUser().fromMap(myData.data() ?? {});

    return theTrueData;
  }

  // Fetch user by ID (useful for network/friends screen)
  Future<MyUser> getUserById(String id) async {
    var ref = userRef.doc(id);
    var myData = await ref.get();
    var theTrueData = MyUser().creatFriend(myData.data() ?? {});

    return theTrueData;
  }

  // Stream to fetch all users (for example, user network or social media platform)
  Stream<List<MyUser>> getNetwork() {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => MyUser().fromMap(doc.data())).toList(),
    );
  }
}
