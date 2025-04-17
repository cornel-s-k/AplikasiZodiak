import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'zodiac_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ZodiacProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zodiac & Profil Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Menggunakan warna pink untuk tema utama
        brightness: Brightness.light, // Menyesuaikan dengan tema terang
        scaffoldBackgroundColor: Colors.pink.shade50, // Background soft pink
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink.shade200, // Warna pink untuk AppBar
          titleTextStyle: TextStyle(
            color: Colors.white,
          ), // Judul AppBar berwarna putih
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87), // Menggunakan bodyLarge
          bodyMedium: TextStyle(
            color: Colors.black54,
          ), // Menggunakan bodyMedium
          titleLarge: TextStyle(
            color: Colors.pink.shade800,
          ), // Menggunakan titleLarge untuk headline
          // Jika ingin menambahkan lagi, gunakan bodySmall, titleSmall sesuai kebutuhan
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.pink.shade300,
            ), // Tombol dengan warna pink
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ), // Teks tombol putih
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zodiac & Profil Mahasiswa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FOTO, NIM, NAMA LANGSUNG DITAMPILKAN DI HALAMAN UTAMA
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/cornel.jpeg',
                    ), // Pastikan file ini ada di folder assets
                  ),
                  SizedBox(height: 10),
                  Text(
                    'NIM: 2310501107', // Ganti dengan NIM kamu
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Nama: Cornelia Lidya', // Ganti dengan nama kamu
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // FORM INPUT ZODIAK
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(
                  color: Colors.pink.shade600,
                ), // Warna label pink
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink.shade300,
                  ), // Warna border saat fokus
                ),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Menggunakan provider untuk memperbarui nama
                Provider.of<ZodiacProvider>(
                  context,
                  listen: false,
                ).setName(value);
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Tanggal Lahir: "),
                TextButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      Provider.of<ZodiacProvider>(
                        context,
                        listen: false,
                      ).setBirthDate(pickedDate);
                    }
                  },
                  child: Consumer<ZodiacProvider>(
                    builder: (context, provider, child) {
                      return Text(
                        "${provider.birthDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                          color: Colors.pink.shade600,
                        ), // Warna teks tombol pink
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // TOMBOL LIHAT ZODIAK
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()),
                );
              },
              child: Text("Lihat Zodiak"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hasil Zodiak')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<ZodiacProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Zodiak Kamu: ${provider.zodiac}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Info Zodiak:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(provider.zodiacDescription),
                SizedBox(height: 20),
                Text(
                  "Info Bulan:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(provider.monthDescription),
              ],
            );
          },
        ),
      ),
    );
  }
}
