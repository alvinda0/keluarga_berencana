import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:keluarga_berencana/Auth/user.dart';
import 'package:keluarga_berencana/reminders.dart';
import 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterEvent) {
      yield* _mapRegisterEventToState(event);
    } else if (event is LoginEvent) {
      yield* _mapLoginEventToState(event);
    } else if (event is UpdateProfileEvent) {
      yield* _mapUpdateProfileEventToState(event);
    }
  }

  Stream<AuthState> _mapRegisterEventToState(RegisterEvent event) async* {
    String url = 'http://192.168.43.34/kb/register.php';
    var response = await http.post(Uri.parse(url), body: {
      'username': event.username,
      'email': event.email,
      'password': event.password,
      'nama_lengkap': event.namalengkap,
      'tempat_lahir': event.tempatlahir,
      'alamat': event.alamat,
      'nomer': event.nomer,
    });

    if (response.statusCode == 200) {
      yield RegisterSuccess();
    } else {
      yield RegisterFailure();
    }
  }

  Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
    String url = 'http://192.168.43.34/kb/login.php';
    var response = await http.post(Uri.parse(url), body: {
      'username': event.username,
      'password': event.password,
    });

    if (response.statusCode == 200) {
      // Ambil ID pengguna dari respons server dan kirim ke UI
      var userId = response.body;
      yield LoginSuccess(
          userId: userId,
          email: '',
          username: '',
          placeOfBirth: '',
          fullName: '',
          address: '',
          phoneNumber: '');
    } else {
      yield LoginFailure();
    }
  }

  Stream<AuthState> _mapUpdateProfileEventToState(
      UpdateProfileEvent event) async* {
    String url = 'http://192.168.43.34/kb/users/read_users.php';
    var response = await http.post(Uri.parse(url), body: {
      'id': event.userId, // Mengirim ID pengguna untuk diupdate
      'new_username': event.newUsername, // Informasi profil baru
      // Tambahkan informasi profil lainnya sesuai kebutuhan
    });

    if (response.statusCode == 200) {
      yield UpdateProfileSuccess();
    } else {
      yield UpdateProfileFailure();
    }
  }
}

class UserApi {
  Future<List<User>> fetchUserList() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.43.34/kb/users/read_users.php'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<User> userList =
            data.map((json) => User.fromJson(json)).toList();
        return userList;
      } else {
        throw Exception('Failed to load user list');
      }
    } catch (e) {
      throw Exception('Failed to load user list');
    }
  }
}

class RemindersApi {
  static Future<List<Reminders>> fetchReminders() async {
    final url =
        Uri.parse('http://192.168.43.34/kb/reminders/get_reminders.php');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parseReminders(response.body);
    } else {
      throw Exception('Failed to load reminders');
    }
  }

  static List<Reminders> parseReminders(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Reminders>((json) => Reminders.fromJson(json)).toList();
  }

  static Future<void> editReminder(
      String reminderID,
      String updatedReminderType,
      DateTime updatedReminderTime,
      String updatedStatus) async {
    final url =
        Uri.parse('http://192.168.43.34/kb/reminders/update_reminder.php');
    try {
      final response = await http.put(
        url,
        body: {
          'reminderID': reminderID,
          'reminderType': updatedReminderType,
          'reminderTime': updatedReminderTime.toString(),
          'status': updatedStatus,
        },
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update reminder: ${response.body}');
      }
    } catch (e) {
      throw Exception('Failed to update reminder: $e');
    }
  }

  static Future<void> deleteReminder(String reminderID) async {
    final url =
        Uri.parse('http://192.168.43.34/kb/reminders/delete_reminder.php');
    final response = await http.post(
      url,
      body: {'reminderID': reminderID},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete reminder');
    }
  }
}
