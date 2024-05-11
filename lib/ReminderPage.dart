import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:keluarga_berencana/Auth/auth_bloc.dart';
import 'reminders.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<Reminders> remindersList = [];

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    fetchReminders();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> fetchReminders() async {
    try {
      final List<Reminders> fetchedReminders =
          await RemindersApi.fetchReminders();
      setState(() {
        remindersList = fetchedReminders;
      });
    } catch (e) {
      throw Exception('Failed to load reminders: $e');
    }
  }

  Future<void> editReminder(String reminderID, String updatedReminderType,
      DateTime updatedReminderTime, String updatedStatus) async {
    try {
      await RemindersApi.editReminder(
          reminderID, updatedReminderType, updatedReminderTime, updatedStatus);
      fetchReminders();
    } catch (e) {
      throw Exception('Failed to update reminder: $e');
    }
  }

  Future<void> deleteReminder(String reminderID) async {
    try {
      await RemindersApi.deleteReminder(reminderID);
      fetchReminders();
    } catch (e) {
      throw Exception('Failed to delete reminder: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          remindersList.isEmpty
              ? Center(
                  child: Text(
                    'Tidak ada jadwal pengingat',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              : ListView.builder(
                  itemCount: remindersList.length,
                  itemBuilder: (context, index) {
                    final reminder = remindersList[index];
                    return ListTile(
                      title: Text(reminder.reminderType),
                      subtitle: Text(reminder.reminderTime),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditReminderForm(context, reminder);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteReminder(reminder.reminderID);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              onPressed: fetchReminders,
              child: Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showEditReminderForm(
      BuildContext context, Reminders reminder) async {
    TextEditingController reminderTypeController =
        TextEditingController(text: reminder.reminderType);
    DateTime selectedDate = DateTime.parse(reminder.reminderTime);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Reminder'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: reminderTypeController,
                  decoration: InputDecoration(labelText: 'Reminder Type'),
                ),
                ListTile(
                  title: Text('Reminder Time'),
                  subtitle: Text(selectedDate.toString()),
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(
                          2000), // Setting firstDate to a far past time
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(selectedDate),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedDate = DateTime(
                            pickedDate.year,
                            pickedDate.month,
                            pickedDate.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        });
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String updatedReminderType = reminderTypeController.text;
                editReminder(
                    reminder.reminderID,
                    updatedReminderType,
                    selectedDate,
                    reminder.status); // Menambahkan status saat mengedit
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
