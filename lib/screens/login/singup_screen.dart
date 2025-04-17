import 'package:flutter/material.dart';
import 'package:linkhub/screens/login/login_screen.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';

class SinupScreen extends StatelessWidget {
  SinupScreen({super.key});
 var email= TextEditingController();
  var passwordNode = FocusNode();
  var RePasswordNode = FocusNode();
  var pas = TextEditingController();
  var rePas = TextEditingController();
  bool isPasswordVisible = true;
  var formKey = GlobalKey<FormState>();
  bool rePasswordNode = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp')
      ,leading: MyBackButton(),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passwordNode);
                      },
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      cursorColor: color4,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color4),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color4),
                        ),
                        label: Text("Enter the email "),
                        prefixIcon: Icon(Icons.email, color: color4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color4),
                        ),
                      ),
                      style: textTheme1.merge(TextStyle(color: color5)),
                    ),
                    SizedBox(height: 20),
                    StatefulBuilder(
          
                      builder: (context, setState) => 
                       TextFormField(
                        onFieldSubmitted:(value) {
                          FocusScope.of(context).requestFocus(RePasswordNode);
                        }, 
                        obscureText: isPasswordVisible,
                        focusNode: passwordNode,
                        controller: pas,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        cursorColor: color4,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                              color: color4,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                          label: Text("Enter the password "),
                          prefixIcon: Icon(Icons.lock, color: color4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                        ),
                        style: textTheme1.merge(TextStyle(color: color4)),
                      ),
                    ),
                    SizedBox(height: 20),
                    StatefulBuilder(
                      builder: (context, setState) => 
                       TextFormField(
                        obscureText: isPasswordVisible,
                        focusNode: RePasswordNode,
                        controller: rePas,
                        validator: (value) {
                          if (pas.text.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value != pas.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        cursorColor: color4,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              rePasswordNode ? Icons.visibility_off : Icons.visibility,
                              color: color4,
                            ),
                            onPressed: () {
                              setState(() {
                                rePasswordNode = !rePasswordNode;
                              });
                            },
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                          label: Text("Re-Enter the password "),
                          prefixIcon: Icon(Icons.lock, color: color4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: color4),
                          ),
                        ),
                        style: textTheme1.merge(TextStyle(color: color4)),
                      ),
                    ),
                    SizedBox(height: 20),
                     ActionButton(
                      title: 'SignUp',
                      style: textTheme1.merge(
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      height: 50,
                      buttonColor: color2,
                      buttonWidth: double.infinity,
                      action: () {
                        if (formKey.currentState?.validate() ?? false) {
                          print(email.text);
                          print(pas.text);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Or',style: TextStyle(color: color4,fontSize:30, fontWeight: FontWeight.w400),),
                    SizedBox(height: 20),
                    ActionButton(
                    title: 'Signup with google',
                    style: textTheme1.merge(
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () {},
                  ),
                  SizedBox(height: 20),
                  ActionButton(
                    title: 'Signup with Facebook',
                    style: textTheme1.merge(
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () {},
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        
                        
                        );


                      },
                      child: Text(
                        'Already have account ',
                        style: TextStyle(color: color5),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}