import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading
    extends AuthState {} // State untuk menampilkan loading saat melakukan registrasi

class RegisterSuccess
    extends AuthState {} // State untuk menampilkan keberhasilan registrasi

class RegisterFailure
    extends AuthState {} // State untuk menampilkan kegagalan registrasi

class LoginLoading
    extends AuthState {} // State untuk menampilkan loading saat melakukan login

class LoginSuccess extends AuthState {
  final String userId;

  LoginSuccess({
    required this.userId,
    required String email,
    required String username,
    required String placeOfBirth,
    required String fullName,
    required String address,
    required String phoneNumber,
  });
} // State untuk menampilkan keberhasilan login

class LoginFailure
    extends AuthState {} // State untuk menampilkan kegagalan login

class UpdateProfileLoading
    extends AuthState {} // State untuk menampilkan loading saat memperbarui profil

class UpdateProfileSuccess
    extends AuthState {} // State untuk menampilkan keberhasilan pembaruan profil

class UpdateProfileFailure
    extends AuthState {} // State untuk menampilkan kegagalan pembaruan profil

class DeleteAccountLoading
    extends AuthState {} // State untuk menampilkan loading saat menghapus akun

class DeleteAccountSuccess
    extends AuthState {} // State untuk menampilkan keberhasilan penghapusan akun

class DeleteAccountFailure
    extends AuthState {} // State untuk menampilkan kegagalan penghapusan akun
