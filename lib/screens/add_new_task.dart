import 'package:flutter/material.dart';
import 'package:task_manager/widget/appbar_widget.dart';

import '../Data/Services/network_caller.dart';
import '../utils/urls.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});
  static const String name = 'AddNewTaskScreen';

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final GlobalKey<FormState> _addTaskFormKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool addingTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Form(
            key: _addTaskFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                SizedBox(height: 50),
                Text(
                  'Add New Task',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: titleController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter a title';
                    }
                    return null;
                  },

                  decoration: InputDecoration(labelText: 'Title'),

                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: descriptionController,
                  maxLines: 8,
                  decoration: InputDecoration(labelText: "Description"),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Visibility(
                  visible: addingTaskInProgress == false,
                  replacement: CircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: () {
                      onAddButtonClick();
                    },
                    child: Text('add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onAddButtonClick() {
    if (_addTaskFormKey.currentState!.validate()) {
      addNewTask();
    }
  }

  Future<void> addNewTask() async {
    setState(() {
      addingTaskInProgress = true;
    });

    Map<String, dynamic> requestBody = {
      'title': titleController.text,
      'description': descriptionController.text,
      'status': 'New',
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createTask,
      body: requestBody,
    );
    if (response.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text('Adding Task is Successful! '),
        ),
      );
      titleController.clear();
      descriptionController.clear();

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          content: Text("${response.errorMessage}"),
        ),
      );
    }
    setState(() {
      addingTaskInProgress = false;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
