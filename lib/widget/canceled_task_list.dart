import 'package:flutter/material.dart';

class CanceledTaskScreen extends StatelessWidget {
  const CanceledTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 10,
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
                    onTap: () {
                      menuFunction('delete');
                    },
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
                style: TextTheme.of(
                  context,
                ).labelSmall?.copyWith(color: Colors.green.shade600),
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
                          'Canceled',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      ),
    );
  }

  void menuFunction(String s) {

  }
}
