import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final npmController = TextEditingController();
    final deptController = TextEditingController();
    final classController = TextEditingController();

    nameController.text = 'Alif Maulana Fanny';
    npmController.text = '43A87006190372';
    deptController.text = 'Teknik Informatika';
    classController.text = 'TI/7/B Pagi';

    return Scaffold(
      appBar: AppBar(title: Text('Profile Pengguna'), backgroundColor: Colors.cyan,),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                foregroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 18),
              TextField(
                readOnly: true,
                controller: npmController,
                decoration: InputDecoration(labelText: 'NPM'),
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama Mahasiswa'),
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                controller: deptController,
                decoration: InputDecoration(labelText: 'Prodi'),
              ),
              const SizedBox(height: 8),
              TextField(
                readOnly: true,
                controller: classController,
                decoration: InputDecoration(labelText: 'Kelas'),
              ),
              const SizedBox(height: 8),
            ],
          )),
    );
  }
}
