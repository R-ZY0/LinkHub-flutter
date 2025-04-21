import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkhub/services/services.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Only for XFile class

class CreateProfileScreen extends StatefulWidget {
  final String userId;

  CreateProfileScreen({super.key, required this.userId});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final githubController = TextEditingController();
  final facebookController = TextEditingController();
  final twitterController = TextEditingController();
  final linkedinController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final phoneNumberNode = FocusNode();

  String? githubAvatarUrl;
  XFile? _image;

  // Using file_picker instead of image_picker
  Future<void> _pickImage() async {
    if (await Permission.storage.request().isGranted) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _image = XFile(result.files.single.path!);
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Storage permission is required to pick an image")),
      );
    }
  }

  void updateGitHubAvatar(String username) {
    if (username.isNotEmpty) {
      setState(() {
        githubAvatarUrl = "https://github.com/$username.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Profile'),
          leading: MyBackButton(),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // Show image if selected
                  if (_image != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ClipOval(
                        child: Image.file(
                          File(_image!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Icon(Icons.account_circle, size: 100, color: Colors.grey),
                    ),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text("Pick Profile Image"),
                  ),
                  SizedBox(height: 20),

                  // Name Field
                  TextFormField(
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(phoneNumberNode),
                    controller: name,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please enter your name' : null,
                    cursorColor: color4,
                    decoration: InputDecoration(
                      label: Text("Enter your name", style: TextStyle(color: color4)),
                      prefixIcon: Icon(Icons.person, color: color4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackBold.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  // Phone Field
                  TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode: phoneNumberNode,
                    controller: phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter your phone number';
                      if (!RegExp(r'^\d+$').hasMatch(value)) {
                        return 'Please enter a valid phone number (numbers only)';
                      }
                      return null;
                    },
                    cursorColor: color4,
                    decoration: InputDecoration(
                      label: Text("Enter your phone number", style: TextStyle(color: color4)),
                      prefixIcon: Icon(Icons.phone, color: color4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color3),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color4)),
                  ),
                  SizedBox(height: 20),

                  // GitHub Username Field
                  TextFormField(
                    controller: githubController,
                    onChanged: (value) => updateGitHubAvatar(value),
                    decoration: InputDecoration(
                      label: Text("GitHub Username", style: TextStyle(color: color4)),
                      prefixIcon: FaIcon(FontAwesomeIcons.github, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  // Facebook URL Field
                  TextFormField(
                    controller: facebookController,
                    decoration: InputDecoration(
                      label: Text("Facebook URL", style: TextStyle(color: color4)),
                      prefixIcon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  // Twitter URL Field
                  TextFormField(
                    controller: twitterController,
                    decoration: InputDecoration(
                      label: Text("Twitter URL", style: TextStyle(color: color4)),
                      prefixIcon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 20),

                  // LinkedIn URL Field
                  TextFormField(
                    controller: linkedinController,
                    decoration: InputDecoration(
                      label: Text("LinkedIn URL", style: TextStyle(color: color4)),
                      prefixIcon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueAccent),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: color4),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color5)),
                  ),
                  SizedBox(height: 30),

                  // Submit Button
                  ActionButton(
                    title: 'Create User',
                    style: textStyleBlackBold.merge(
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        await FireBaseServices().createNewUser(
                          uid: widget.userId,
                          name: name.text.trim(),
                          phone: phone.text.trim(),
                          context: context,
                          profileImage: _image,
                          socialMediaPlatforms: {
                            'github': githubController.text.trim(),
                            'facebook': facebookController.text.trim(),
                            'twitter': twitterController.text.trim(),
                            'linkedin': linkedinController.text.trim(),
                          },
                        );
                      }
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
