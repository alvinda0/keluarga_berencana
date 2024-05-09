import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<DateTime> reminders =
      []; // List of reminders, you can replace it with your data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: reminders.isEmpty
          ? Center(
              child: Text('No reminders'),
            )
          : ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                return ReminderListItem(
                  dateTime: reminders[index],
                  onEdit: () {
                    // Handle edit action
                  },
                  onDelete: () {
                    // Handle delete action
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add reminder page
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ReminderListItem extends StatelessWidget {
  final DateTime dateTime;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ReminderListItem({
    required this.dateTime,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text('${_getFormattedDate(dateTime)} ${_getFormattedTime(dateTime)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String _getFormattedTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
