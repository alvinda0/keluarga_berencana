import 'package:flutter/material.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String userId;
  final String email;
  final String username;
  final String placeOfBirth;
  final String fullName;
  final String address;
  final String phoneNumber;

  LoginSuccess({
    required this.userId,
    required this.email,
    required this.username,
    required this.placeOfBirth,
    required this.fullName,
    required this.address,
    required this.phoneNumber,
  });
}

class LoginFailure extends AuthState {}

class UpdateProfileLoading extends AuthState {}

class UpdateProfileSuccess extends AuthState {}

class UpdateProfileFailure extends AuthState {}
