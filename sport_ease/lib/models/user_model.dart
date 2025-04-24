class UserModel {
  final String uid; //id unik pengguna (auth firebase)
  final String namaLengkap;
  final String noTelepon;
  final String email;
  final String alamat;
//wajib diisi ketika membuat objek baru
  UserModel({
    required this.uid,
    required this.namaLengkap,
    required this.noTelepon,
    required this.email,
    required this.alamat,
  });
//menubah data pengguna ke dalam bentuk map( seperti data JSON) agar bisa disimpan di database (firestore)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'namaLengkap': namaLengkap,
      'noTelepon': noTelepon,
      'email': email,
      'alamat': alamat,
    };
  }
//membuat objek dari data map(ambil data dari database)
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      namaLengkap: map['namaLengkap'],
      noTelepon: map['noTelepon'],
      email: map['email'],
      alamat: map['alamat'],
    );
  }
}
