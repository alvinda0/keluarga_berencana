import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keluarga_berencana/Auth/auth_bloc.dart';

import 'Auth/user.dart';

class ProfilePage extends StatefulWidget {
  final String userId;

  ProfilePage({required this.userId});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _userListController = StreamController<List<User>>();
  late Stream<List<User>> _userListStream;

  final UserApi _userApi = UserApi();

  @override
  void initState() {
    super.initState();
    _userListStream = _userListController.stream;
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    try {
      final userList = await _userApi.fetchUserList();
      _userListController.sink.add(userList);
    } catch (e) {
      setState(() {
        _userListStream = Stream.error(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<User>>(
        stream: _userListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        controller: TextEditingController(text: user.email),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi antar input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                        ),
                        controller:
                            TextEditingController(text: user.namalengkap),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi antar input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Tempat Lahir',
                        ),
                        controller:
                            TextEditingController(text: user.tempatlahir),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi antar input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Alamat',
                        ),
                        controller: TextEditingController(text: user.alamat),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi antar input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                        ),
                        controller: TextEditingController(text: user.nomer),
                      ),
                    ),
                    SizedBox(height: 16.0), // Spasi antar input
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your button's onPressed logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green, // Background color of button
                        ),
                        child: Text(
                          'Simpan',
                          style: TextStyle(
                              color: Colors.white), // Text color of button
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _userListController.close();
    super.dispose();
  }
}
