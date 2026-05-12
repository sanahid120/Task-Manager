import 'package:flutter/material.dart';
import 'package:task_manager/widget/canceled_task_list.dart';
import 'package:task_manager/widget/complete_task_list.dart';
import 'package:task_manager/widget/homepage_row_list.dart';
import 'package:task_manager/widget/progress_task_listview.dart';

import '../widget/appbar_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String name = 'HomepageScreen';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    HomepageLists(),
    ProgressTaskScreen(),
    CanceledTaskScreen(),
    CompleteTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: screens[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: 'New',
          ),
          NavigationDestination(
            icon: Icon(Icons.access_time_outlined),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel_outlined),
            label: 'Canceled',
          ),
          NavigationDestination(icon: Icon(Icons.done), label: 'Complete'),
        ],
      ),

    );
  }
}
