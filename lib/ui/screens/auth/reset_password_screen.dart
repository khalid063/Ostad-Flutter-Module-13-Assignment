import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_managers/reset_password_controller.dart';
import '../../style/style.dart';
import '../../widgets/app_background.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String recoveryEmail, recoveryOtp;
  const ResetPasswordScreen({super.key, required this.recoveryEmail, required this.recoveryOtp});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
                  SizedBox(height: MediaQuery.of(context).size.height/4),
                  Text('Reset Password', style: appHeadingText1(colorBlack),),
                  const SizedBox(height: 10,),
                  Text('Minimum password length should be 8 characters with letter and number combination', style: appHeadingText3(colorLightGrey),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: myInputDecoration('Password'),
                    obscureText: true,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Password";
                      }else if(value!.length < 6){
                        return "Enter at least 6 Character Password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration: myInputDecoration('Confirm Password'),
                    obscureText: true,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Confirm Password";
                      }else if(value != _passwordTEController.text){
                        return "Confirm Password didn't match with Password";
                      }
                      return null;
                    },

                  ),

                  const SizedBox(height: 25,),
                  GetBuilder<ResetPasswordController>(
                    builder: (resetPasswordController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: resetPasswordController.resetPasswordInProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: (){
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              resetPasswordController.resetPassword(widget.recoveryEmail, widget.recoveryOtp, _passwordTEController.text).then((result) => {
                                if(result == true){
                                  Get.snackbar(
                                    'Success',
                                    'Password Reset Successful',
                                    colorText: Colors.red,
                                  ),
                                  Get.offAll( ()=> const LoginScreen()),
                                }else{
                                  Get.snackbar(
                                    'Failed',
                                    'Password Reset Failed',
                                    colorText: Colors.red,
                                    padding: const EdgeInsets.all(15),
                                  ),
                                }
                              });
                            },
                            style: appButtonStyle(),
                            child: const Text('Confirm'),
                          ),
                        ),
                      );
                    }
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30,),
                            Text("Have an account?", style: appHeadingText5(colorBlack),),
                            InkWell(
                              onTap: (){
                                Get.offAll(()=> const LoginScreen());
                              },
                              child: Text(' Sign in', style: appHeadingText5(colorGreen),),),
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
      ),
    );
  }
}
