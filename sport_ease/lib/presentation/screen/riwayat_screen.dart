import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pendaftaran"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Contoh acara 1
          _buildRiwayatCard(
            title: "Bulu Tangkis",
            date: "Senin, 15:00 - 17:00 WIB",
            status: "Ditolak",
            statusColor: Colors.red,
          ),
          const SizedBox(height: 10),
          // Contoh acara 2
          _buildRiwayatCard(
            title: "Futsal",
            date: "Rabu, 16:00 - 17:00 WIB",
            status: "Proses",
            statusColor: Colors.yellow,
          ),
          const SizedBox(height: 10),
          // Contoh acara 3
          _buildRiwayatCard(
            title: "Bulu Tangkis",
            date: "Senin, 15:00 - 17:00 WIB",
            status: "Diterima",
            statusColor: Colors.green,
          ),
          const SizedBox(height: 10),
          // Contoh acara 4
          _buildRiwayatCard(
            title: "Futsal",
            date: "Rabu, 16:00 - 17:00 WIB",
            status: "Proses",
            statusColor: Colors.yellow,
          ),
        ],
      ),
    );
  }

  Widget _buildRiwayatCard({
    required String title,
    required String date,
    required String status,
    required Color statusColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Gambar ikon untuk acara
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 16),
            // Deskripsi acara dan status
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Status
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}