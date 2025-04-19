import 'package:flutter/material.dart';

void goto(  BuildContext context,  Widget screen){
Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => screen),
              );

}

void gotoWithNoBackButton(  BuildContext context,  Widget screen){
Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context) => screen),
              );

}