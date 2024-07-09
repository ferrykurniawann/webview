// import 'package:flutter/material.dart';

// class Profilpage extends StatelessWidget {
//   const Profilpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Home Page'),
//         ),
//         body: Center(
//             child: Column(
//           children: [
//             Text('Profil'),
//             ElevatedButton(onPressed: () {}, child: Text('Kembali'))
//           ],
//         )));
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _hobbiesController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto Profil
                GestureDetector(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _image == null
                        ? NetworkImage('https://via.placeholder.com/150')
                        : FileImage(_image!) as ImageProvider,
                  ),
                ),
                SizedBox(height: 16),

                // Nama
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                  ),
                ),
                SizedBox(height: 8),

                // Posisi atau Jabatan
                TextField(
                  controller: _positionController,
                  decoration: InputDecoration(
                    labelText: 'Posisi atau Jabatan',
                  ),
                ),
                SizedBox(height: 8),

                // Email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 8),

                // Telepon
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                  ),
                ),
                SizedBox(height: 8),

                // Alamat
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                  ),
                ),
                SizedBox(height: 8),

                // Tanggal Lahir
                TextField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                ),
                SizedBox(height: 8),

                // Hobi
                TextField(
                  controller: _hobbiesController,
                  decoration: InputDecoration(
                    labelText: 'Hobi',
                  ),
                ),
                SizedBox(height: 32),

                // Tombol Simpan Perubahan
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Aksi untuk menyimpan perubahan bisa ditambahkan di sini
                      // Misalnya, menyimpan data ke dalam database atau state management
                    });
                  },
                  child: Text('Simpan Perubahan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
  ));
}