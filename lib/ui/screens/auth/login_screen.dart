import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project_getx/ui/screens/auth/signup_screen.dart';
import '../../state_managers/login_controller.dart';
import '../../style/style.dart';
import '../../widgets/app_background.dart';
import '../bottom_nav_base_screen.dart';
import 'email_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Text(
                  'Get Started With',
                  style: appHeadingText1(colorBlack),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: myInputDecoration('Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Provide a Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: myInputDecoration('Password'),
                  obscureText: true,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<LoginController>(
                  builder: (loginController) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: loginController.loginInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            loginController.login(_emailTEController.text.trim(), _passwordTEController.text).then((result) {
                              if(result == true){
                                Get.offAll( ()=> const BottomNavBaseScreen());
                              }else{
                                Get.snackbar(
                                    'Login Failed', 'Please Check the info again.',
                                  colorText: Colors.red,
                                );
                              }
                            });
                          },
                          style: appButtonStyle(),
                          child: const Icon(Icons.arrow_circle_right_outlined),
                        ),
                      ),
                    );
                  }
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to( ()=> const EmailVerificationScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: appHeadingText6(colorLightGrey),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Don't have an account?",
                            style: appHeadingText5(colorBlack),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to( ()=> const SignupScreen());
                            },
                            child: Text(
                              ' Sign Up',
                              style: appHeadingText5(colorGreen),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
