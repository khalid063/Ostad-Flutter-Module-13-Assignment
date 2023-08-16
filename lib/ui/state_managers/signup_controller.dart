import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SignUpController extends GetxController{
  bool _signupInProgress = false;
  bool get signupInProgress => _signupInProgress;

  Future<bool> userSignUp(String email, String firstName, String lastName, String mobile, String password) async {
    _signupInProgress = true;
    update();

    Map<String, dynamic> requestBody = <String, dynamic>{
      "email" : email,
      "firstName" : firstName,
      "lastName" : lastName,
      "mobile" : mobile,
      "password" : password,
      "photo" : '',
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.registrationUrl, requestBody);
    _signupInProgress = false;
    update();
    if(response.isSuccess){
      return true;
    }else{
      return false;
    }
  }
}