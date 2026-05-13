import 'package:flutter/material.dart';
import 'package:task_manager/screens/add_new_task.dart';

class HomepageLists extends StatelessWidget {
  const HomepageLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            const SizedBox(height: 8),
            listTaskSummary(),
            const Divider(),
            ListView.separated(
              itemCount: 10,
              primary: false,
              shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPressStart: (details) {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        details.globalPosition.dx,
                        details.globalPosition.dy,
                        details.globalPosition.dx,
                        details.globalPosition.dy,
                      ),
                      items: [
                        PopupMenuItem(
                          onTap: () { menuFunction('delete');},
                          padding: const EdgeInsets.all(6),
                          value: 'delete',
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                  child: ListTile(
                    title: const Text('Title of the task'),
                    trailing: Text(
                      '12 June 2021',
                      style: TextTheme.of(context).labelSmall?.copyWith(
                        color: Colors.green.shade600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description of the task',
                          style: TextTheme.of(context).bodySmall?.copyWith(
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'New',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewTask.name);
        },
        foregroundColor: Colors.black,

        child: Icon(Icons.add_outlined),
      ),
    );
  }

  SizedBox listTaskSummary() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '10',
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Canceled',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

  }

  void menuFunction(String s) {
    // handle menu actions here
  }
}