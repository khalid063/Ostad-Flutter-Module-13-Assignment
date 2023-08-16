import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../style/style.dart';

class UpdateTaskSheet extends StatefulWidget {
  final TaskData task;
  final VoidCallback onUpdate;

  const UpdateTaskSheet({super.key, required this.task, required this.onUpdate});

  @override
  State<UpdateTaskSheet> createState() => _UpdateTaskSheetState();
}

class _UpdateTaskSheetState extends State<UpdateTaskSheet> {
  late TextEditingController _titleTEController;
  late TextEditingController _descriptionTEController;

  bool _updateTaskInProgress = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleTEController = TextEditingController(text: widget.task.title);
    _descriptionTEController = TextEditingController(text: widget.task.description);
  }

  Future<void> updateTask() async {

    _updateTaskInProgress = true;
    if(mounted){
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      //"status": "Completed"
    };

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.createTaskUrl, requestBody);

    _updateTaskInProgress = false;
    if(mounted){
      setState(() {});
    }

    if(response.isSuccess){
      _titleTEController.clear();
      _descriptionTEController.clear();

      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Updated Successfully', style: snackBarText(chipBgColorGreen),)));
      }
      widget.onUpdate();
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Update Failed', style: snackBarText(chipBgColorRed),)));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: MediaQuery.of(context).size.height/16),
                Row(
                  children: [
                    Text('Update Task', style: appHeadingText1(colorBlack),),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_outlined),
                    ),
                  ],
                ),
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
                  maxLines: 6,
                  validator: (String? value){
                    if(value?.isEmpty ?? true){
                      return 'Enter Task Description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _updateTaskInProgress == false,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: ElevatedButton(
                      onPressed: (){
                        if(!_formKey.currentState!.validate()){
                          return;
                        }
                        updateTask();
                      },
                      style: appButtonStyle(),
                      child: const Text('Update'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}