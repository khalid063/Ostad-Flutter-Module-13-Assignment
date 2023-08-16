import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class AddNewTaskController extends GetxController{
  bool _addNewTaskInProgress = false;
  bool get addNewTaskInProgress => _addNewTaskInProgress;

  Future<bool> addNewTask(String title, String description) async {

    _addNewTaskInProgress = true;
    update();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New"
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createTaskUrl, requestBody);

    _addNewTaskInProgress = false;
    update();

    if(response.isSuccess && response.body?['status'] == 'success'){
      return true;
    }else{
      return false;
    }

  }
}