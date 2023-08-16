import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/add_new_task_controller.dart';
import '../style/style.dart';
import '../widgets/app_background.dart';
import '../widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UserProfileBanner(),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height/16),
                      Text('Add New Task', style: appHeadingText1(colorBlack),),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _titleTEController,
                        decoration: myInputDecoration('Title'),
                        validator: (String? value){
                          if(value?.isEmpty ?? true){
                            return 'Enter Task Title';
                          }
                          return null;
                        },

                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: _descriptionTEController,
                        decoration: myInputDecoration('Description'),
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        validator: (String? value){
                          if(value?.isEmpty ?? true){
                            return 'Enter Task Description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20,),
                      GetBuilder<AddNewTaskController>(
                        builder: (addNewTaskController) {
                          return SizedBox(
                            width: double.infinity,
                            child: Visibility(
                              visible: addNewTaskController.addNewTaskInProgress == false,
                              replacement: const Center(child: CircularProgressIndicator(),),
                              child: ElevatedButton(
                                onPressed: (){
                                  if(!_formKey.currentState!.validate()){
                                    return;
                                  }
                                  addNewTaskController.addNewTask(_titleTEController.text.trim(), _descriptionTEController.text.trim()).then((result) => {
                                    if(result == true){
                                      _formKey.currentState?.reset(),
                                      _titleTEController.clear(),
                                      _descriptionTEController.clear(),
                                      Get.snackbar(
                                        'Successful',
                                        'Task Created Successfully!',
                                        colorText: Colors.white,
                                        padding: const EdgeInsets.all(15),
                                        backgroundColor: Colors.green,
                                      ),
                                    }else{
                                      Get.snackbar(
                                        'Failed',
                                        'Task Creation Failed!',
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
