import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class ResetPasswordController extends GetxController{
  bool _resetPasswordInProgress = false;
  bool get resetPasswordInProgress => _resetPasswordInProgress;
  Future<bool> resetPassword(String recoveryEmail, String recoveryOtp, String password) async {
    _resetPasswordInProgress = true;
    update();

    final Map<String, dynamic> requestBody = {
      "email": recoveryEmail,
      "OTP": recoveryOtp,
      "password": password
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.recoverPasswordResetUrl, requestBody);
    _resetPasswordInProgress = false;
    update();
    if(response.isSuccess && response.body?['status'] == 'success'){
      return true;
    }else{
      return false;
    }

  }
}