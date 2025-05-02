import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/providers/daftar_provider.dart';
import '../widget/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Provider.of<DaftarProvider>(context, listen: false)
          .fetchRiwayat(user.uid);
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'disetujui':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final daftarProvider = Provider.of<DaftarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pendaftaran'),
        centerTitle: true,
        backgroundColor: Color(0xFF166BAA),
      ),
      body: daftarProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : daftarProvider.riwayatList.isEmpty
              ? const Center(child: Text('Belum ada riwayat pendaftaran.'))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: daftarProvider.riwayatList.length,
                  itemBuilder: (context, index) {
                    final item = daftarProvider.riwayatList[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CustomCard(
                        // backgroundColor: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama: ${item.namaLengkap}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('No. Telepon: ${item.noTelepon}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Alamat: ${item.alamat}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Kategori: ${item.kategori}',
                                style: const TextStyle(color: Colors.white70)),
                            Text('Tanggal: ${item.tanggal}',
                                style: const TextStyle(color: Colors.white70)),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(item.status),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item.status,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
