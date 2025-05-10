// import 'package:flutter/material.dart';
// import '../widget/upcoming_card.dart';
// import 'detail_olahraga_screen.dart';
// import 'home_screen.dart';

// class EventScreen extends StatefulWidget {
//   const EventScreen({super.key});

//   @override
//   State<EventScreen> createState() => _EventScreenState();
// }

// class _EventScreenState extends State<EventScreen> {
//   final List<_Olahraga> _listOlahraga = [
//     _Olahraga(
//       hariJam: "Senin, 15.00 - 17.00 WIB",
//       nama: "Bulu Tangkis",
//       pelatih: "Bapak Sugiyo",
//       lokasi: "Gor Bung Karno Kab.Nganjuk",
//       imageUrl: "assets/image/badminton/badminton2.jpeg",
//     ),
//     _Olahraga(
//       hariJam: "Rabu, 16.00 - 18.00 WIB",
//       nama: "Futsal",
//       pelatih: "Bapak Sugeng",
//       lokasi: "Gor Bung Karno Kab.Nganjuk",
//       imageUrl: "assets/image/futsal/futsal2.jpeg",
//     ),
//     _Olahraga(
//       hariJam: "Kamis, 16.00 - 18.00 WIB",
//       nama: "Voli",
//       pelatih: "Bapak Jiman",
//       lokasi: "Gedung Juang 45 Kab.Nganjuk",
//       imageUrl: "assets/image/voly/voly1.png",
//     ),
//     _Olahraga(
//       hariJam: "Minggu, 08.00 - 10.00 WIB",
//       nama: "Karate",
//       pelatih: "Bapak Andik",
//       lokasi: "Gor Bung Karno Kab.Nganjuk",
//       imageUrl: "assets/image/karate/karate1.jpeg",
//     ),
//     _Olahraga(
//       hariJam: "Jum'at, 15.00 - 17.00 WIB",
//       nama: "Taekwondo",
//       pelatih: "Bapak Sugeng",
//       lokasi: "Gedung Juang 45 Kab.Nganjuk",
//       imageUrl: "https://picsum.photos/seed/taekwondo/200/120",
//     ),
//   ];

//   final TextEditingController _searchController = TextEditingController();
//   late List<_Olahraga> _displayList;

//   @override
//   void initState() {
//     super.initState();
//     _displayList = _listOlahraga;
//   }

//   void _filterList(String query) {
//     setState(() {
//       _displayList = query.isEmpty
//           ? _listOlahraga
//           : _listOlahraga.where((olahraga) {
//               final q = query.toLowerCase();
//               return olahraga.nama.toLowerCase().contains(q) ||
//                   olahraga.pelatih.toLowerCase().contains(q);
//             }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const HomeScreen()),
//           ),
//         ),
//         title: const Text("Event"),
//         titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
//         backgroundColor: const Color(0xFF166BAA),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: _filterList,
//               decoration: InputDecoration(
//                 hintText: "Pencarian...",
//                 prefixIcon: const Icon(Icons.search),
//                 contentPadding: const EdgeInsets.symmetric(
//                     vertical: 0, horizontal: 12),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _displayList.length,
//               itemBuilder: (context, index) {
//                 final item = _displayList[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 6.0, horizontal: 12.0),
//                   child: UpcomingCard(
//                     imageUrl: item.imageUrl,
//                     title: item.nama,
//                     location: item.lokasi,
//                     date: item.hariJam,
//                     price: "Gratis",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DetailOlahragaScreen(
//                             hariJam: item.hariJam,
//                             nama: item.nama,
//                             pelatih: item.pelatih,
//                             lokasi: item.lokasi,
//                             imageUrl: item.imageUrl,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Olahraga {
//   final String hariJam;
//   final String nama;
//   final String pelatih;
//   final String lokasi;
//   final String imageUrl;

//   _Olahraga({
//     required this.hariJam,
//     required this.nama,
//     required this.pelatih,
//     required this.lokasi,
//     required this.imageUrl,
//   });
// }
