import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sport_ease/models/daftar_model.dart';
import 'package:sport_ease/providers/daftar_provider.dart';
import 'daftar2_screen.dart';

class Daftar1Screen extends StatefulWidget {
  final String? namaOlahraga;

  const Daftar1Screen({super.key, this.namaOlahraga});

  @override
  State<Daftar1Screen> createState() => _Daftar1ScreenState();
}

class _Daftar1ScreenState extends State<Daftar1Screen> {
  final _namaController = TextEditingController();
  final _telpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _kategoriController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.namaOlahraga != null) {
      _kategoriController.text = widget.namaOlahraga!;
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _telpController.dispose();
    _alamatController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER BIRU
            Container(
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "DAFTAR",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Lengkapi Data Diri Anda",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // CARD PUTIH
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              transform: Matrix4.translationValues(0, -16, 0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Form fields for input
                  const Text("Nama Lengkap", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // No Telepon
                  const Text("No. Telepon", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _telpController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Masukkan No. Telepon",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Alamat
                  const Text("Alamat", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _alamatController,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Masukkan Alamat",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Kategori Olahraga
                  const Text("Kategori Olahraga", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _kategoriController,
                    decoration: InputDecoration(
                      hintText: "Masukkan atau Pilih Kategori Olahraga",
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Tombol Daftar
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onDaftarPressed,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue.shade500,
                      ),
                      child: const Text("Daftar", style: TextStyle(fontSize: 16, color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Validasi dan Penyimpanan data
  void _onDaftarPressed() async {
    final nama = _namaController.text.trim();
    final telp = _telpController.text.trim();
    final alamat = _alamatController.text.trim();
    final kategori = _kategoriController.text.trim();

    if (nama.isEmpty || telp.isEmpty || alamat.isEmpty || kategori.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mohon lengkapi data.")),
      );
      return;
    }

    // Ambil userId dari FirebaseAuth
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    final data = DaftarModel(
      namaLengkap: nama,
      noTelepon: telp,
      alamat: alamat,
      kategori: kategori,
      tanggal: _formatTanggal(DateTime.now()),
      userId: userId,
    );

    // Simpan data ke provider atau Firestore
    Provider.of<DaftarProvider>(context, listen: false).tambahPendaftaran(data);

    // Navigasi ke halaman Daftar2Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Daftar2Screen()),
    );
  }

  String _formatTanggal(DateTime dateTime) {
    // Format tanggal ke string, misalnya: 26-04-2025
    return '${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }
}
