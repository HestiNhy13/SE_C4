import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sport_ease/views/screens/login_screen.dart';

class RegisterController {
  final BuildContext context;

  RegisterController(this.context);

  void handleRegister(String email, String password, String confirmPassword) async {
    email = email.trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackbar('Semua field harus diisi.');
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      _showPopup('Email harus menggunakan @gmail.com');
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      _showSnackbar('Masukkan email yang valid.');
      return;
    }

    if (!RegExp(r'^[a-z0-9]{8,}$').hasMatch(password)) {
      _showPopup('Password hanya boleh berisi huruf kecil dan angka, minimal 8 karakter.');
      return;
    }

    if (!RegExp(r'^[a-z0-9]{8,}$').hasMatch(confirmPassword)) {
      _showPopup('Konfirmasi password hanya boleh berisi huruf kecil dan angka, minimal 8 karakter.');
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar('Password dan konfirmasi tidak cocok.');
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'createdAt': Timestamp.now(),
        });

        _showSuccessDialog();
      }
    } on FirebaseAuthException catch (e) {
      _showSnackbar(e.message ?? 'Terjadi kesalahan saat mendaftar.');
    } catch (e) {
      _showSnackbar('Terjadi kesalahan yang tidak diketahui.');
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _showPopup(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Peringatan',
      desc: message,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    ).show();
  }

  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Pendaftaran Berhasil',
      desc: 'Selamat, akun kamu berhasil dibuat. Silakan login!',
      btnOkText: 'LOGIN',
      btnOkOnPress: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    ).show();
  }
}
