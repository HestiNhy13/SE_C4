import 'package:flutter/material.dart';
import 'package:sport_ease/core/controllers/daftar1_controller.dart';

class Daftar1Screen extends StatefulWidget {
  final String? namaOlahraga;

  const Daftar1Screen({super.key, this.namaOlahraga});

  @override
  State<Daftar1Screen> createState() => _Daftar1ScreenState();
}

class _Daftar1ScreenState extends State<Daftar1Screen> {
  late Daftar1Controller _controller;

  @override
  void initState() {
    super.initState();
    _controller = Daftar1Controller(context, widget.namaOlahraga);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        Text("DAFTAR", style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("Lengkapi Data Diri Anda", style: TextStyle(color: Colors.white70, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
              transform: Matrix4.translationValues(0, -16, 0),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _inputField("Nama Lengkap", _controller.namaController, "Masukkan Nama Lengkap"),
                  _inputField("No. Telepon", _controller.telpController, "Masukkan No. Telepon", keyboardType: TextInputType.phone),
                  _inputField("Alamat", _controller.alamatController, "Masukkan Alamat", maxLines: 2),
                  _inputField("Kategori Olahraga", _controller.kategoriController, "Masukkan atau Pilih Kategori Olahraga"),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _controller.onDaftarPressed,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  Widget _inputField(String label, TextEditingController controller, String hint,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
