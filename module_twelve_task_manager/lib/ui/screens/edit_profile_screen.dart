import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:module_twelve_task_manager/data/models/user_model.dart';
import 'package:module_twelve_task_manager/data/network_coller/network_coller.dart';
import 'package:module_twelve_task_manager/data/network_coller/network_response.dart';
import 'package:module_twelve_task_manager/data/utility/urls.dart';
import 'package:module_twelve_task_manager/ui/widgets/snack_massage.dart';
import '../../ui/controller/auth_controller.dart';
import '../widgets/body_background.dart';
import '../widgets/profile_summery_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _updateProfileInProgress = false;

  XFile? photo;
  @override
  void initState() {
    super.initState();
    _firstNameTEController.text = AuthController.user?.firstName ?? "";
    _lastNameTEController.text = AuthController.user?.lastName ?? '';
    _emailTEController.text = AuthController.user?.email ?? '';
    _mobileTEController.text = AuthController.user?.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummeryCard(
              enableOnTap: false,
            ),
            Expanded(
              child: BodyBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Update Profile',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          photoPickerField(),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _firstNameTEController,
                            decoration: const InputDecoration(
                              hintText: 'First Name',
                            ),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your first name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _lastNameTEController,
                            decoration: const InputDecoration(
                              hintText: 'Last Name',
                            ),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your last name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _emailTEController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _mobileTEController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: 'Mobile',
                            ),
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your mobile number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _passwordTEController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'Password (optional)'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible: _updateProfileInProgress == false,
                              replacement: const Center(
                                child: CircularProgressIndicator(),
                              ),
                              child: ElevatedButton(
                                onPressed: updateProfile,
                                child: const Icon(
                                    Icons.arrow_circle_right_outlined),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateProfile() async {
    _updateProfileInProgress = true;
    if (mounted) {
      setState(() {});
    }
    String? photoInBase64;
    Map<String, dynamic> inputData = {
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _firstNameTEController.text.trim(),
      "email": _emailTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": "123456",
    };
    if (_passwordTEController.text.isNotEmpty) {
      inputData['password'] = _passwordTEController.text;
    }

    if (photo != null) {
      List<int> imageBytes = await photo!.readAsBytes();
      photoInBase64 = base64Encode(imageBytes);
      inputData['photo'] = photoInBase64;
    }

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.updateProfile,
      body: inputData,
    );
    _updateProfileInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      AuthController.upadteUserInformation(
        UserModel(
            firstName: _firstNameTEController.text.trim(),
            lastName: _lastNameTEController.text.trim(),
            email: _emailTEController.text.trim(),
            mobile: _mobileTEController.text.trim(),
            photo: photoInBase64 ?? AuthController.user?.photo),
      );
      if (mounted) {
        showSnackMessage(context, 'Update profile success!');
      }
    } else {
      if (mounted) {
        showSnackMessage(context, 'Update profile failed. Try again.');
      }
    }
  }

  Container photoPickerField() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: () async {
                final XFile? image = await ImagePicker()
                    .pickImage(source: ImageSource.camera, imageQuality: 50);
                if (image != null) {
                  photo = image;
                  if (mounted) {
                    setState(() {});
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                child: Visibility(
                    visible: photo == null,
                    replacement: Text(photo?.name ?? ''),
                    child: const Text('Select a photo')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
