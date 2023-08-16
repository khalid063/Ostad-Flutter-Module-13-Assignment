import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationInProgress = false;
  bool get emailVerificationInProgress => _emailVerificationInProgress;
  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.emailVerificationUrl(email));

    _emailVerificationInProgress = false;
    update();


    if(response.isSuccess && response.body?['status'] == 'success'){
      return true;
    }else{
      return false;
    }
  }
}