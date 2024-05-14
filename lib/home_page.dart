import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late final String userId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perencanaan Keluarga',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Apa Itu Perencanaan Keluarga?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Perencanaan keluarga adalah tindakan sadar untuk mengatur jumlah dan jarak antara kelahiran anak dalam sebuah keluarga. Tujuannya adalah untuk memungkinkan pasangan menentukan kapan dan berapa banyak anak yang mereka ingin miliki.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Mengapa Perencanaan Keluarga Penting?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Perencanaan keluarga memiliki dampak yang signifikan, termasuk:',
            ),
            SizedBox(height: 8.0),
            Text('1. Peningkatan kesehatan ibu dan anak'),
            Text('2. Peningkatan status sosial dan ekonomi keluarga'),
            Text('3. Pengurangan angka kelahiran yang tidak direncanakan'),
            Text('4. Mengurangi tekanan pada sumber daya alam'),
            SizedBox(height: 16.0),
            Text(
              'Metode Kontrasepsi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ada berbagai jenis metode kontrasepsi yang tersedia, antara lain:',
            ),
            SizedBox(height: 8.0),
            Text('1. Kontrasepsi hormonal (pil KB, suntik, dll.)'),
            Text('2. Kontrasepsi barrier (kondom, diafragma, dll.)'),
            Text('3. Metode alami (pantau siklus menstruasi)'),
            Text('4. Metode permanen (sterilisasi pria dan wanita)'),
            SizedBox(height: 16.0),
            Text(
              'Dimana Mendapatkan Layanan Perencanaan Keluarga?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Anda dapat mendapatkan layanan perencanaan keluarga dari berbagai fasilitas kesehatan, seperti klinik kesehatan reproduksi, puskesmas, dan rumah sakit. Dokter atau petugas kesehatan akan membantu Anda memilih metode kontrasepsi yang sesuai dengan kebutuhan dan kondisi kesehatan Anda.',
            ),
            SizedBox(height: 16.0),
            Text(
              'Pentingnya Edukasi Perencanaan Keluarga',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Selain itu, edukasi tentang perencanaan keluarga sangat penting. Ini membantu meningkatkan kesadaran masyarakat tentang pentingnya merencanakan keluarga dengan bijak, sehingga dapat meningkatkan kualitas hidup dan kesejahteraan keluarga.',
            ),
          ],
        ),
      ),
    );
  }
}
