import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkhub/services/services.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';


class CreateProfileScrean extends StatelessWidget {
  
  final name = TextEditingController();

  final phone = TextEditingController();
String  userId;
  final formKey = GlobalKey<FormState>();

  final PhnoeNumberNode = FocusNode();

  bool isPhoneNumber = true;
CreateProfileScrean({super.key ,required this.userId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Cerate Profile'), leading: MyBackButton()),
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
                      FocusScope.of(context).requestFocus(PhnoeNumberNode);
                    },
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
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
                      label: Text(
                        "Enter the name ",
                        style: TextStyle(color: color4),
                      ),
                      prefixIcon: Icon(Icons.person, color: color4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackBold.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  StatefulBuilder(
                    builder: (context, setState) => TextFormField(
                      keyboardType: TextInputType.number, // Numeric keyboard
                      focusNode: PhnoeNumberNode,
                      controller: phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allow only digits
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                          return 'Please enter a valid phone number (numbers only)';
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
                        label: Text(
                          "Enter the phone number ",
                          style: TextStyle(color: color4),
                        ),
                        prefixIcon: Icon(Icons.phone, color: color4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: color3),
                        ),
                      ),
                      style: textStyleBlackNormal.merge(
                        TextStyle(color: color4),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                  ActionButton(
                    title: 'Create User',
                    style: textStyleBlackBold.merge(
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () async {
                      
                          FocusScope.of(context).requestFocus(FocusNode());
                        
                      FireBaseServices().createNewUser(
                        uid: userId,
                         name: name.text,
                          phone: phone.text,
                            context: context,
                          );
                    },
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



