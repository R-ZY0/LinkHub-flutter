import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkhub/screens/screens.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart'; // make sure you import your colors
import 'package:linkhub/shared/themes/text.dart'; // make sure you import your text styles

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUserByEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        gotoWithNoBackButton(context, CreateProfileScreen(userId: value.user!.uid));
      });

      // ✅ Success Snackbar
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

    } on FirebaseAuthException catch (e) {
      String message = '';
      IconData icon = FontAwesomeIcons.circleExclamation;

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
        icon = FontAwesomeIcons.lock;
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
        icon = FontAwesomeIcons.envelopeCircleCheck;
      } else {
        message = 'Authentication error: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              FaIcon(icon, color: color4),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: textStyleBlackNormal,
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 2),
          backgroundColor: color2,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              FaIcon(FontAwesomeIcons.triangleExclamation, color: color4),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'An unexpected error occurred.',
                  style: textStyleBlackNormal,
                ),
              ),
            ],
          ),
          duration: Duration(seconds: 2),
          backgroundColor: color2,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // First step: Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Second step: Check Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();

      if (userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Login successful!',
              style: textStyleBlackNormal,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: color2,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );

        // ✅ Navigate to Profile Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No user data found in database.',
              style: textStyleBlackNormal,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: color2,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String error = '';
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided.';
      } else {
        error = ' ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error,
            style: textStyleBlackNormal,
          ),
          duration: Duration(seconds: 2),
          backgroundColor: color2,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Unexpected error occurred.',
              style: textStyleBlackNormal,
            ),
            duration: Duration(seconds: 2),
            backgroundColor: color2,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
    }
  }
}
