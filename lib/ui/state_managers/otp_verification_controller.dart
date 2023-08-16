import 'package:get/get_state_manager/get_state_manager.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class OtpVerificationController extends GetxController{
  bool _otpVerificationInProgress = false;
  bool get otpVerificationInProgress => _otpVerificationInProgress;
  Future<bool> otpVerification(String recoveryEmail, String recoveryOtp) async {
    _otpVerificationInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.otpVerificationUrl(recoveryEmail, recoveryOtp));
    _otpVerificationInProgress = false;
    update();

    if(response.isSuccess && response.body?['status'] == 'success'){
      return true;
    }else{
      return false;
    }
  }
}