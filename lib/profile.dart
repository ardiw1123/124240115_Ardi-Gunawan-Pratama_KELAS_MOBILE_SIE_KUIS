import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF7F2),
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 40, color: Colors.blue),
            ),
            SizedBox(height: 12),
            Text(
              'Ardi Gunawan Pratama',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Pelanggan Setia Kopdes Merah Putih',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(Icons.shop, color: Colors.blue),
                ),
                title: Text(
                  'Kopdes Merah Putih',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Pesan Item favorit Anda dengan mudah di Kopdes Pasar Goib.',
                ),
              ),
            ),
            SizedBox(height: 8),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(Icons.local_printshop, color: Colors.blue),
                ),
                title: Text(
                  'Barang Unggulan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Pulpen, Pensil, Buku Tulis, Penghapus, Penggaris',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
