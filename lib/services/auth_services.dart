import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkhub/screens/screens.dart';
import 'package:linkhub/shared/methods/navigation.dart';

class Auth {
  void createUserByEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        gotoWithNoBackButton(context, CreateProfileScrean(userId: value.user!.uid));
      });
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
          backgroundColor: Colors.redAccent,
          content: Row(
            children: [
              FaIcon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text(message)),
            ],
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Row(
            children: const [
              FaIcon(FontAwesomeIcons.triangleExclamation, color: Colors.white),
              SizedBox(width: 12),
              Expanded(child: Text('An unexpected error occurred.')),
            ],
          ),
        ),
      );
    }
  }
}

