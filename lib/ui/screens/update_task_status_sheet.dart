import 'package:flutter/material.dart';
import '../../data/models/network_response.dart';
import '../../data/models/task_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';
import '../style/style.dart';


class UpdateTaskStatusSheet extends StatefulWidget {

  final TaskData task;
  final VoidCallback onUpdate;
  const UpdateTaskStatusSheet({super.key, required this.task, required this.onUpdate});

  @override
  State<UpdateTaskStatusSheet> createState() => _UpdateTaskStatusSheetState();
}

class _UpdateTaskStatusSheetState extends State<UpdateTaskStatusSheet> {
  List<String> taskStatusList = ['new', 'progress', 'cancelled', 'completed'];
  late String _selectedTask;
  bool updateTaskStatusInProgress = false;

  @override
  void initState() {
    super.initState();
    _selectedTask = widget.task.status!;
  }

  Future<void> updateTaskStatus(String taskId, String newStatus) async {
    updateTaskStatusInProgress = false;
    if(mounted){
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.updateTaskStatusUrl(taskId, newStatus));


    if(response.isSuccess){

      widget.onUpdate();
      if(mounted){
        Navigator.pop(context);
      }
    }else{
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Failed to Update Task Status Data',
              style: snackBarText(chipBgColorRed),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Update Status', style: appHeadingText2(colorBlack),),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taskStatusList.length,
                itemBuilder: (context, index){
                  return ListTile(
                    onTap: (){
                      _selectedTask = taskStatusList[index].capitalize();
                      setState(() {});
                    },
                    title: Text(taskStatusList[index].capitalize()),
                    trailing: _selectedTask == taskStatusList[index].capitalize()
                        ? const Icon(Icons.check_circle_outline_outlined)
                        : null,
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Visibility(
                visible: updateTaskStatusInProgress == false,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ElevatedButton(
                  onPressed: (){
                    updateTaskStatus(widget.task.sId!, _selectedTask);
                  },
                  style: appButtonStyle(),
                  child: Text('Update', style: appHeadingText5(colorWhite),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _taskListModel {
// }

extension MyExtension on String{
  String capitalize(){
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
