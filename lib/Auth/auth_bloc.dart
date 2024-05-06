import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:keluarga_berencana/Auth/auth_state.dart';
import 'package:meta/meta.dart';

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
    String url = 'http://192.168.43.34/kb/crud_users.php';
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
