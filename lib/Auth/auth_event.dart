part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String namalengkap;
  final String tempatlahir;
  final String alamat;
  final String nomer;
  RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.namalengkap,
    required this.tempatlahir,
    required this.alamat,
    required this.nomer,
  });
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({
    required this.username,
    required this.password,
  });
}

class UpdateProfileEvent extends AuthEvent {
  final String userId;
  final String newUsername; // Menambahkan parameter newUsername
  final String newFullName;
  final String newPlaceOfBirth;
  final String newAddress;
  final String newPhoneNumber;

  UpdateProfileEvent({
    required this.userId,
    required this.newUsername, // Menambahkan this.newUsername
    required this.newFullName,
    required this.newPlaceOfBirth,
    required this.newAddress,
    required this.newPhoneNumber,
  });
}
