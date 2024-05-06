import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keluarga_berencana/Auth/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  final String userId;
  final String username;
  final String email;
  final String fullName;
  final String placeOfBirth;
  final String address;
  final String phoneNumber;

  ProfilePage({
    required this.userId,
    required this.username,
    required this.email,
    required this.fullName,
    required this.placeOfBirth,
    required this.address,
    required this.phoneNumber,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController fullNameController;
  late TextEditingController placeOfBirthController;
  late TextEditingController addressController;
  late TextEditingController phoneNumberController;

  late AuthBloc authBloc; // Deklarasi blok otentikasi

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.fullName);
    placeOfBirthController = TextEditingController(text: widget.placeOfBirth);
    addressController = TextEditingController(text: widget.address);
    phoneNumberController = TextEditingController(text: widget.phoneNumber);

    authBloc =
        BlocProvider.of<AuthBloc>(context); // Inisialisasi blok otentikasi
  }

  @override
  void dispose() {
    fullNameController.dispose();
    placeOfBirthController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    String fullName = fullNameController.text;
    String placeOfBirth = placeOfBirthController.text;
    String address = addressController.text;
    String phoneNumber = phoneNumberController.text;

    // Panggil blok otentikasi untuk mengirim pembaruan profil ke backend
    authBloc.add(UpdateProfileEvent(
      userId: widget.userId,
      newFullName: fullName,
      newPlaceOfBirth: placeOfBirth,
      newAddress: address,
      newPhoneNumber: phoneNumber,
      newUsername: '',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(labelText: 'Full Name'),
                ),
                TextFormField(
                  controller: placeOfBirthController,
                  decoration: InputDecoration(labelText: 'Place of Birth'),
                ),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _updateProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
