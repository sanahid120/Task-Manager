import 'package:flutter/material.dart';
import 'package:task_manager/widget/appbar_widget.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});
static const String name = 'AddNewTaskScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
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
                decoration: InputDecoration(
                  labelText: 'Title',

                ),

                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextFormField(
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: "Description",


                ),
                


                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ElevatedButton(onPressed: () {
                onAddButtonClick();
              }, child: Text('add')),
              
            ],
          ),
        ),
      ),

    );
  }

  void onAddButtonClick() {}
}
