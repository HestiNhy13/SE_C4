import 'package:provider/provider.dart';
import 'package:sport_ease/providers/user_provider.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          // Profile background and image
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/sunset.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Implement edit profile picture
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          // User Name
          Text(
            user?.namaLengkap ?? 'Nama tidak tersedia',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // Card info
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senin, 15.00 - 17.00 WIB',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Bulu Tangkis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pelatih - Bapak Sugiyo',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Gor Bung Karno Kab. Nganjuk',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
