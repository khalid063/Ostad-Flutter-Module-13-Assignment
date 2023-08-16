import 'package:flutter/material.dart';
import '../../data/models/task_list_model.dart';
import '../style/style.dart';

class TaskListTile extends StatelessWidget {
  final VoidCallback onDeleteTap, onEditTap;
  final Color chipBgColor;
  final String taskStatus;

  const TaskListTile({
    super.key,
    required this.chipBgColor,
    required this.taskStatus,
    required this.data,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.title ?? 'Unknown',
        style: listTileTitle(colorBlack),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.description ?? 'Unknown',
            style: listTileSubTitle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data.createdDate ?? '',
            style: listTileSubTitle2(colorBlack),
          ),
          Row(
            children: [
              Chip(
                labelPadding: const EdgeInsets.fromLTRB(12, -3, 12, -3),
                label: Text(
                  data.status ?? taskStatus,
                  style: const TextStyle(fontSize: 13),
                ),
                backgroundColor: chipBgColor,
                //padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                labelStyle: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                onPressed: onEditTap,
                icon: const Icon(
                  Icons.edit_document,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: onDeleteTap,
                icon: const Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
