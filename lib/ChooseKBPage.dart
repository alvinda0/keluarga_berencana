import 'package:flutter/material.dart';

class ChooseKBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Pil KB'),
            onTap: () {
              _showOptionsDialog(context, 'Pil KB');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Suntik KB'),
            onTap: () {
              _showOptionsDialog(context, 'Suntik KB');
            },
          ),
          Divider(),
          ListTile(
            title: Text('IUD (Alat Kontrasepsi Dalam Rahim)'),
            onTap: () {
              _showOptionsDialog(context, 'IUD (Alat Kontrasepsi Dalam Rahim)');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Kondom'),
            onTap: () {
              _showOptionsDialog(context, 'Kondom');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Implan KB'),
            onTap: () {
              _showOptionsDialog(context, 'Implan KB');
            },
          ),
          // Add more options as needed
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, String selectedKB) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilihan untuk $selectedKB'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Atur Pengingat'),
                onTap: () {
                  // Action when reminder option is selected
                  Navigator.pop(context); // Close the dialog
                  // Navigate to reminder page or perform action
                },
              ),
              ListTile(
                title: Text('Informasi Lebih Lanjut'),
                onTap: () {
                  // Action when more info option is selected
                  Navigator.pop(context); // Close the dialog
                  // Navigate to more info page or perform action
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
