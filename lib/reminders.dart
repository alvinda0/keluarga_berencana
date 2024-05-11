class Reminders {
  final String reminderID;
  final String userID;
  final String reminderType;
  final String reminderTime;
  final String status;

  Reminders({
    required this.reminderID,
    required this.userID,
    required this.reminderType,
    required this.reminderTime,
    required this.status,
  });

  factory Reminders.fromJson(Map<String, dynamic> json) {
    return Reminders(
      reminderID: json['ReminderID'] ?? '',
      userID: json['UserID'] ?? '',
      reminderType: json['ReminderType'] ?? '',
      reminderTime: json['ReminderTime'] ?? '',
      status: json['Status'] ?? '',
    );
  }

  Reminders copyWith({
    String? reminderID,
    String? userID,
    String? reminderType,
    String? reminderTime,
    String? status,
  }) {
    return Reminders(
      reminderID: reminderID ?? this.reminderID,
      userID: userID ?? this.userID,
      reminderType: reminderType ?? this.reminderType,
      reminderTime: reminderTime ?? this.reminderTime,
      status: status ?? this.status,
    );
  }
}
