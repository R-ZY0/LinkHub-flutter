import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/screens/profile_screen.dart';
import 'package:linkhub/services/models.dart';
import 'package:linkhub/shared/methods/navigation.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
class FireBaseServices{
var fireStorRef=FirebaseFirestore.instance;
var userRef=FirebaseFirestore.instance.collection('users');


createNewUser({required String name, required String phone,context}) async {
                        var ref =userRef.doc();
                           
                          
                        var user = MyUser(
                          name: name,
                          phone: phone,
                          
                          imge: 'https://example.com/image.jpg',
                          socialMediaPlatforms: {
                            'Facebook': 'https://facebook.com/user',
                            'Twitter': 'https://twitter.com/user',
                            'Instagram': 'https://instagram.com/user',
                          },
                        );

                        
                        await ref.set(user.toMap());
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'User Created Successfully!',
                              style: textStyleBlackNormal,
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: color2,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            
                          ),
                        );
                         await Future.delayed(Duration(seconds: 2));
                        goto(context, ProfileScreen());
}


Future<MyUser> getUser() async {
  var ref = userRef.doc('OgXI0qIPMWWNU1MtbFmF');
  var myData = await ref.get();
 var theTrueData = MyUser().fromMap(myData.data() ?? {});
  
  return theTrueData;

}
}