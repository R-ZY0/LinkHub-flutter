import 'package:flutter/material.dart';

void goto(  BuildContext context,  Widget screen){
Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => screen),
              );

}