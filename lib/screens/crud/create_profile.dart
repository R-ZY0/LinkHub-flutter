import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkhub/services/services.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';
import 'package:linkhub/shared/widgets/action_button.dart';
import 'package:linkhub/shared/widgets/back_button.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateProfileScreen extends StatefulWidget {
  final String userId;

  const CreateProfileScreen({super.key, required this.userId});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final phoneNumberNode = FocusNode();
  XFile? _image;

  String? selectedPlatform;

  // Available platforms with icons
  final Map<String, IconData> availablePlatforms = {
    'GitHub': FontAwesomeIcons.github,
    'Facebook': FontAwesomeIcons.facebook,
    'Twitter': FontAwesomeIcons.twitter,
    'LinkedIn': FontAwesomeIcons.linkedin,
    'Instagram': FontAwesomeIcons.instagram,
    'Snapchat': FontAwesomeIcons.snapchatGhost,
    'YouTube': FontAwesomeIcons.youtube,
    'WhatsApp': FontAwesomeIcons.whatsapp,
    'Telegram': FontAwesomeIcons.telegram,
    'Pinterest': FontAwesomeIcons.pinterest,
    'TikTok': FontAwesomeIcons.tiktok,
    'Reddit': FontAwesomeIcons.reddit,
  };

  List<String> selectedPlatforms = [];
  Map<String, TextEditingController> platformControllers = {};

  Future<void> _pickImage() async {
  PermissionStatus permissionStatus;

  if (Platform.isAndroid) {
    permissionStatus = await Permission.photos.request();
    if (!permissionStatus.isGranted) {
      permissionStatus = await Permission.storage.request();
    }
  } else if (Platform.isIOS) {
    permissionStatus = await Permission.photos.request();
  } else {
    permissionStatus = PermissionStatus.granted;
  }

  if (permissionStatus.isGranted) {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        _image = XFile(result.files.single.path!);
      });
    }
  } else if (permissionStatus.isPermanentlyDenied) {
    openAppSettings();
  } else {
     ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Permission is required to pick an image..',
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

  void _addPlatform(String platform) {
    if (!selectedPlatforms.contains(platform)) {
      setState(() {
        selectedPlatforms.add(platform);
        platformControllers[platform] = TextEditingController();
      });
    }
  }

  void _removePlatform(String platform) {
    setState(() {
      selectedPlatforms.remove(platform);
      platformControllers.remove(platform);
    });
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    platformControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Profile'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  // Profile Image
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
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.grey,
                      ),
                    ),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text("Pick Profile Image"),
                  ),
                  const SizedBox(height: 20),

                  // Name Field
                  TextFormField(
                    controller: name,
                    onFieldSubmitted:
                        (_) => FocusScope.of(
                          context,
                        ).requestFocus(phoneNumberNode),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Please enter your name'
                                : null,
                    cursorColor: color4,
                    decoration: InputDecoration(
                      labelText: "Enter your name",
                      prefixIcon: Icon(Icons.person, color: color4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    style: textStyleBlackBold.merge(TextStyle(color: color5)),
                  ),
                  const SizedBox(height: 20),

                  // Phone Field
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phone,
                    focusNode: phoneNumberNode,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Allow only digits
                      LengthLimitingTextInputFormatter(
                        11,
                      ), // Restrict input to 11 digits
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your phone number';
                      if (value.length != 11) {
                        return 'Phone number must be 11 digits';
                      }
                      return null;
                    },
                    cursorColor: color4,
                    decoration: InputDecoration(
                      labelText: "Enter your phone number",
                      prefixIcon: Icon(Icons.phone, color: color4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    style: textStyleBlackNormal.merge(TextStyle(color: color4)),
                  ),

                  const SizedBox(height: 20),

                  // Social Media Selector
                  DropdownButtonFormField<String>(
                    key: ValueKey(selectedPlatforms.length),
                    value: null,
                    hint: Text(
                      'Select a Social Media',
                      style: textStyleWhiteNormal,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    items:
                        availablePlatforms.keys
                            .where(
                              (platform) =>
                                  !selectedPlatforms.contains(platform),
                            )
                            .map(
                              (platform) => DropdownMenuItem(
                                value: platform,
                                child: Row(
                                  children: [
                                    FaIcon(
                                      availablePlatforms[platform],
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(platform),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        _addPlatform(value);
                        Future.microtask(() {
                          setState(() {
                            selectedPlatform = null;
                          });
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  // Dynamic Platform Inputs
                  Column(
                    children:
                        selectedPlatforms.map((platform) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  availablePlatforms[platform],
                                  size: 20,
                                  color: color3,
                                ), // <-- neutral color
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: platformControllers[platform],
                                    decoration: InputDecoration(
                                      labelText: '$platform URL or Username',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    style: textStyleBlackBold.merge(
                                      TextStyle(color: color5),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => _removePlatform(platform),
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 30),

                  // Submit Button
                  ActionButton(
                    title: 'Create User',
                    style: textStyleBlackBold.merge(
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    height: 50,
                    buttonColor: color2,
                    buttonWidth: double.infinity,
                    action: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        Map<String, String> socialLinks = {};
                        selectedPlatforms.forEach((platform) {
                          socialLinks[platform.toLowerCase()] =
                              platformControllers[platform]?.text ?? '';
                        });

                        await FireBaseServices().createNewUser(
                          uid: widget.userId,
                          name: name.text.trim(),
                          phone: phone.text.trim(),
                          context: context,
                          profileImage: _image ?? XFile(''),
                          socialMediaPlatforms: socialLinks,
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
