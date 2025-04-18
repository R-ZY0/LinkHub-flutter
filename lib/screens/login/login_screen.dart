import 'package:flutter/material.dart';
import 'package:linkhub/screens/login/singup_screen.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final email = TextEditingController();

  final pas = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final passwordNode = FocusNode();

  

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Login'),
        leading: MyBackButton(),),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Padding(
            padding: const EdgeInsets.all(25.0),
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
                    style: textStyleBlackBold.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  StatefulBuilder(
                    builder: (context, setState) => 
                     TextFormField(
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
                      style: textStyleBlackNormal.merge(TextStyle(color: color4)),
                    ),
                  ),

                  SizedBox(height: 30),
                  ActionButton(
                    title: 'Login',
                    style: textStyleBlackBold.merge(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'forgot password?',
                        style: TextStyle(color: color5),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  ActionButton(
                    title: 'Login with google',
                    style: textStyleWhiteBold.merge(
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () {},
                  ),
                  SizedBox(height: 20),
                  ActionButton(
                    title: 'Login Facebook',
                    style: textStyleWhiteBold.merge(
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
                            builder: (context) => SinupScreen(),),);
                      },
                      child: Text(
                        'Don\'t have account ',
                        style: TextStyle(color: color5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
