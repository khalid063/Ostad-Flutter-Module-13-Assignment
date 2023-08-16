import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_managers/email_verification_controller.dart';
import '../../style/style.dart';
import '../../widgets/app_background.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  //bool _emailVerificationInProgress = false;

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
                  Text('Your Email Address', style: appHeadingText1(colorBlack),),
                  const SizedBox(height: 10,),
                  Text('A 6 digit verification pin will be sent to  your email address', style: appHeadingText3(colorLightGrey),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: myInputDecoration('Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return "Enter Email Address";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 25,),
                  GetBuilder<EmailVerificationController>(
                    builder: (emailVerificationController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: emailVerificationController.emailVerificationInProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: (){
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              emailVerificationController.emailVerification(_emailTEController.text.trim()).then((result) => {
                                if(result == true){
                                  Get.to( ()=> OtpVerificationScreen(recoveryEmail: _emailTEController.text.trim())),
                                }else{
                                  Get.snackbar(
                                    'Verification Failed',
                                    'Email Verification Failed',
                                    colorText: Colors.red,
                                    padding: const EdgeInsets.all(15),
                                  ),
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
                            const SizedBox(height: 30,),
                            Text("Have an account?", style: appHeadingText5(colorBlack),),
                            InkWell(
                              onTap: (){
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
      ),
    );
  }
}
