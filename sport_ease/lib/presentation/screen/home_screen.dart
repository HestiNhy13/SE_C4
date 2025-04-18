import 'package:flutter/material.dart';
// Import file pendaftaran agar bisa Navigator.push ke halamannya
import '../screen/pendaftaran_screen.dart';
import '../screen/riwayat_screen.dart';
import '../screen/profil_screen.dart';

void main() {
  runApp(const MyApp());
}

/// Kelas [MyApp] adalah root widget aplikasi.
/// Di sini kita set [MaterialApp] dan menentukan [HomeScreen] sebagai halaman awal.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Fungsi build ini dipanggil pertama kali saat widget dirender.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beranda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false, // Menghilangkan label debug di pojok
    );
  }
}

/// [HomeScreen] adalah halaman utama (beranda) aplikasi.
/// Menggunakan [StatefulWidget] karena kita butuh state untuk bottom navigation.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variabel untuk menandakan indeks tab bottom navigation yang aktif
  int _selectedIndex = 0;

  // Fungsi yang dipanggil saat item bottom navigation ditekan
  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // TAMBAHAN:
    // Jika user menekan ikon "Pendaftaran" (posisi index = 1),
    // maka langsung pindah ke halaman Pendaftaran
    // Navigasi berdasarkan tab yang dipilih
    if (index == 1) {
      // Navigasi ke PendaftaranScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PendaftaranScreen(),
        ),
      );
    } else if (index == 2) {
      // Navigasi ke RiwayatScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RiwayatScreen(),
        ),
      );
    } else if (index == 3) {
      // Navigasi ke ProfilPage ketika item 'Akun' ditekan
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    }
  }
  //   if (index == 1) {
  //     Navigator.pushNamed(
  //         context, '/pendaftaran'); // Navigasi ke halaman Pendaftaran
  //   } else if (index == 2) {
  //     Navigator.pushNamed(context, '/riwayat'); // Navigasi ke halaman Riwayat
  //   }
  // }

  /// Fungsi build menampilkan UI utama (sama seperti kode Anda).
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // -- BAGIAN APP BAR / LOGO / BACK --
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    // Tombol Back
                    InkWell(
                      onTap: () {
                        // Misalnya Navigator.pop(context) jika ini bukan halaman utama
                      },
                      child: const Icon(Icons.arrow_back_ios, size: 24),
                    ),
                    const Spacer(),
                    // Logo di Kanan
                    Image.asset(
                      'assets/images/logo1.png',
                      width: 50,
                      height: 70,
                    ),
                  ],
                ),
              ),

              // -- TRENDING EVENTS JUDUL --
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: const [
                    Text(
                      "Trending Events 🔥",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // -- SEARCH BAR --
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search event...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // -- CAROUSEL / HORIZONTAL LIST TRENDING --
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    // Kartu 1
                    _buildTrendingCard(
                      imageUrl: "https://picsum.photos/id/1015/400/200",
                      title: "Final Badminton SMA 1 Rejos...",
                      date: "30 Mei 2025",
                      price: "IDR50.000/org",
                      context: context,
                    ),
                    // Kartu 2
                    _buildTrendingCard(
                      imageUrl: "https://picsum.photos/id/1016/400/200",
                      title: "Karate KejurProv 2025",
                      date: "01 Juni 2025",
                      price: "IDR50.000/org",
                      context: context,
                    ),
                    // Kartu 3
                    _buildTrendingCard(
                      imageUrl: "https://picsum.photos/id/1018/400/200",
                      title: "Basket 3 on 3",
                      date: "10 Juni 2025",
                      price: "IDR100.000/org",
                      context: context,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // -- UPCOMING EVENTS --
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming Events",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Aksi "See all" jika perlu
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // -- LIST UPCOMING (2 contoh card) --
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    // Kartu upcoming 1
                    _buildUpcomingCard(
                      context: context,
                      imageUrl: "https://picsum.photos/id/1023/200/120",
                      title: "Futsal: Final SMAN 1 Tjnj...",
                      location: "Gedung Juang 45 Nganjuk",
                      date: "Jul 12, 2025",
                      price: "IDR50.000",
                    ),
                    const SizedBox(height: 12),
                    // Kartu upcoming 2
                    _buildUpcomingCard(
                      context: context,
                      imageUrl: "https://picsum.photos/id/1020/200/120",
                      title: "Voly: Piala Bupati Nganjuk 20...",
                      location: "Gedung Juang 45 Nganjuk",
                      date: "Jul 22, 2025",
                      price: "IDR75.000",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 70),
            ],
          ),
        ),
      ),

      // -- BOTTOM NAVIGATION --
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration_rounded),
            label: 'Pendaftaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  // Widget Card Trending
  Widget _buildTrendingCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String date,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        // Navigasi ke DetailScreen (sama seperti sebelumnya)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageUrl: imageUrl,
              title: title,
              date: date,
              location: "Gelanggang Remaja",
              price: price,
              description:
                  "Ini adalah deskripsi lengkap untuk event bernama $title. "
                  "Belum saya ubah di bagian ini",
            ),
          ),
        );
      },
      child: Container(
        width: 230,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(8),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                date,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Text(
                "Start from $price",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Card Upcoming
  Widget _buildUpcomingCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String location,
    required String date,
    required String price,
  }) {
    return InkWell(
      onTap: () {
        // Navigasi ke DetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              imageUrl: imageUrl,
              title: title,
              date: date,
              location: location,
              price: price,
              description:
                  "Ini adalah deskripsi lengkap untuk event bernama $title. "
                  "Belum saya ubah di bagian ini",
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                price,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tetap sama, tanpa perubahan
class DetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String location;
  final String price;
  final String description;

  const DetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.location,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(imageUrl, height: 220, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text("Date: $date", style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("Location: $location",
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(
                    "Price: $price",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 16),
                  Text(description, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}