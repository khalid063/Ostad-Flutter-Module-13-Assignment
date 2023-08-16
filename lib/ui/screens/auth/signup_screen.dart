import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_managers/signup_controller.dart';
import '../../style/style.dart';
import '../../widgets/app_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();


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
                  SizedBox(height: MediaQuery.of(context).size.height/11),
                  Text('Join With Us', style: appHeadingText1(colorBlack),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: myInputDecoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return 'Enter Your Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _firstNameTEController,
                    decoration: myInputDecoration('First Name'),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return 'Enter Your First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: myInputDecoration('Last Name'),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return 'Enter Your Last Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration: myInputDecoration('Mobile'),
                    keyboardType: TextInputType.phone,
                    validator: (String? value){
                      if((value?.isEmpty ?? true) || value!.length < 11){
                        return 'Enter Your Mobile Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: myInputDecoration('Password'),
                    obscureText: true,
                    validator: (String? value){
                      if((value?.isEmpty ?? true) || value!.length < 3){
                        return 'Enter Your Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  GetBuilder<SignUpController>(
                    builder: (signUpController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: signUpController.signupInProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: (){
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              signUpController.userSignUp(
                                _emailTEController.text.trim(),
                                _firstNameTEController.text.trim(),
                                _lastNameTEController.text.trim(),
                                _mobileTEController.text.trim(),
                                _passwordTEController.text,
                              ).then((result) => {
                              if(result == true){
                                Get.snackbar(
                                'Registration Success', 'Your Account Creation Successful',
                                colorText: Colors.green,
                              )
                              }else{
                              Get.snackbar(
                              'Registration Failed', 'Please Check the info again.',
                              colorText: Colors.red,
                              )
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
                        const SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("Have an account?", style: appHeadingText5(colorBlack),),
                            InkWell(
                              onTap: (){
                                //Navigator.pop(context);
                                Get.back();
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
      )
    );
  }
}


