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
            children: selectedKB == 'Suntik KB'
                ? [
                    ListTile(
                      title: Text('Sedang Menyusui'),
                      onTap: () {
                        // Show date picker popup
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData
                                  .light(), // Change if you want a different theme
                              child: child!,
                            );
                          },
                        ).then((selectedDate) {
                          // Do something with the selected date
                          if (selectedDate != null) {
                            print('Selected date: $selectedDate');
                            // You can navigate to another page here passing the selected date if needed
                          }
                        });
                      },
                    ),
                    ListTile(
                      title: Text('Tidak Sedang Menyusui'),
                      onTap: () {
                        // Show date picker popup
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData
                                  .light(), // Change if you want a different theme
                              child: child!,
                            );
                          },
                        ).then((selectedDate) {
                          // Do something with the selected date
                          if (selectedDate != null) {
                            print('Selected date: $selectedDate');
                            // You can navigate to another page here passing the selected date if needed
                          }
                        });
                      },
                    ),
                  ]
                : selectedKB == 'Implan KB'
                    ? [
                        ListTile(
                          title: Text('Norplant: 1 batang = 5 tahun'),
                          onTap: () {
                            // Show date picker popup
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData
                                      .light(), // Change if you want a different theme
                                  child: child!,
                                );
                              },
                            ).then((selectedDate) {
                              // Do something with the selected date
                              if (selectedDate != null) {
                                print('Selected date: $selectedDate');
                                // You can navigate to another page here passing the selected date if needed
                              }
                            });
                          },
                        ),
                        ListTile(
                          title: Text('Implanon: 2 batang = 3 tahun'),
                          onTap: () {
                            // Show date picker popup
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData
                                      .light(), // Change if you want a different theme
                                  child: child!,
                                );
                              },
                            ).then((selectedDate) {
                              // Do something with the selected date
                              if (selectedDate != null) {
                                print('Selected date: $selectedDate');
                                // You can navigate to another page here passing the selected date if needed
                              }
                            });
                          },
                        ),
                        ListTile(
                          title: Text('Indoplant: 3 batang = 3 tahun'),
                          onTap: () {
                            // Show date picker popup
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData
                                      .light(), // Change if you want a different theme
                                  child: child!,
                                );
                              },
                            ).then((selectedDate) {
                              // Do something with the selected date
                              if (selectedDate != null) {
                                print('Selected date: $selectedDate');
                                // You can navigate to another page here passing the selected date if needed
                              }
                            });
                          },
                        ),
                      ]
                    : [],
          ),
        );
      },
    );
  }
}
