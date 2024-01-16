import 'package:crafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Welcome back',
                ), //style: Theme.of(context.textTheme.titleLarge,

                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Please enter your email address',
                ), //style: Theme.of(context).textTheme.bodySmall,

                const SizedBox(
                  height: 16,
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
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) ;
                        {
                          Get.to(() => const VerifyOtpScreen());
                        }
                      },
                      child: const Text('Next'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
