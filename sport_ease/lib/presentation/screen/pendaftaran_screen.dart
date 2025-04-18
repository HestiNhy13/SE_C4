import 'package:flutter/material.dart';
import '../screen/detail_olahraga_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendaftaran',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PendaftaranScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Screen / Halaman Pendaftaran
class PendaftaranScreen extends StatefulWidget {
  const PendaftaranScreen({super.key});

  @override
  State<PendaftaranScreen> createState() => _PendaftaranScreenState();
}

class _PendaftaranScreenState extends State<PendaftaranScreen> {
  // Contoh data daftar kelas/olahraga
  final List<_Olahraga> _listOlahraga = [
    _Olahraga(
      hariJam: "Senin, 15.00 - 17.00 WIB",
      nama: "Bulu Tangkis",
      pelatih: "Bapak Sugiyo",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/bulutangkis/200/120", // Contoh
    ),
    _Olahraga(
      hariJam: "Rabu, 16.00 - 18.00 WIB",
      nama: "Futsal",
      pelatih: "Bapak Sugeng",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/futsal/200/120",
    ),
    _Olahraga(
      hariJam: "Kamis, 16.00 - 18.00 WIB",
      nama: "Voli",
      pelatih: "Bapak Jiman",
      lokasi: "Gedung Juang 45 Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/voli/200/120",
    ),
    _Olahraga(
      hariJam: "Minggu, 08.00 - 10.00 WIB",
      nama: "Karate",
      pelatih: "Bapak Andik",
      lokasi: "Gor Bung Karno Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/karate/200/120",
    ),
    _Olahraga(
      hariJam: "Jum'at, 15.00 - 17.00 WIB",
      nama: "Taekwondo",
      pelatih: "Bapak Sugeng",
      lokasi: "Gedung Juang 45 Kab.Nganjuk",
      imageUrl: "https://picsum.photos/seed/taekwondo/200/120",
    ),
    // Tambahkan item lain sesuai kebutuhan
  ];

  final TextEditingController _searchController = TextEditingController();
  late List<_Olahraga> _displayList;

  @override
  void initState() {
    super.initState();
    _displayList = _listOlahraga;
  }

  void _filterList(String query) {
    if (query.isEmpty) {
      setState(() {
        _displayList = _listOlahraga;
      });
    } else {
      setState(() {
        _displayList = _listOlahraga.where((olahraga) {
          final namaLower = olahraga.nama.toLowerCase();
          final pelatihLower = olahraga.pelatih.toLowerCase();
          final queryLower = query.toLowerCase();
          return namaLower.contains(queryLower) ||
              pelatihLower.contains(queryLower);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar dengan ikon back di kiri dan judul di tengah
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Aksi kembali, misalnya:
            Navigator.pop(context);
          },
        ),
        title: const Text("Pendaftaran"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _filterList(value),
              decoration: InputDecoration(
                hintText: "Pencarian...",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Expanded agar ListView memenuhi sisa ruang
          Expanded(
            child: ListView.builder(
              itemCount: _displayList.length,
              itemBuilder: (context, index) {
                final item = _displayList[index];
                return _buildListItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(_Olahraga item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // Gambar di sisi kiri
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        // Judul + subjudul
        title: Text(
          item.hariJam,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.nama,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("Pelatih -> ${item.pelatih}"),
            Text(item.lokasi),
          ],
        ),
        onTap: () {
          // Aksi saat item ditekan, misalnya buka detail
          //ketika diklik pindah ke detailolahraga.dart
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailOlahragaScreen(
                hariJam: item.hariJam,
                nama: item.nama,
                pelatih: item.pelatih,
                lokasi: item.lokasi,
                imageUrl: item.imageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Olahraga {
  final String hariJam;
  final String nama;
  final String pelatih;
  final String lokasi;
  final String imageUrl;

  _Olahraga({
    required this.hariJam,
    required this.nama,
    required this.pelatih,
    required this.lokasi,
    required this.imageUrl,
  });
}