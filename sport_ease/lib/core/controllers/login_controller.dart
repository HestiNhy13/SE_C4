import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../services/auth_service.dart';

class LoginController {
  static Future<void> handleLogin({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required Function(String?) setEmailError,
  required Function(String?) setPasswordError,
}) async {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  // Reset error
  setEmailError(null);
  setPasswordError(null);

  // Validasi
  final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*\d)[a-z\d]{8,}$');

  bool hasError = false;

  if (!emailRegex.hasMatch(email)) {
    setEmailError('Tulis email dengan format yang benar');
    hasError = true;
  }

  if (!passwordRegex.hasMatch(password)) {
    setPasswordError('Password harus minimal 8 karakter, huruf kecil & angka');
    hasError = true;
  }

  if (hasError) return;

  try {
    // Cek apakah email ada di Firestore
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (userSnapshot.docs.isEmpty) {
      _showDialog(
        context,
        DialogType.warning,
        'Email Belum Terdaftar',
        'Email belum terdaftar, daftar terlebih dahulu.',
      );
      return;
    }

    // Lanjut login
    final authResult = await AuthService().loginUser(
      email: email,
      password: password,
    );

    if (authResult == null) {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        final user = UserModel.fromMap(uid, doc.data()!);
        context.read<UserProvider>().setUser(user);
        Navigator.pushReplacementNamed(context, '/beranda');
      } else {
        _showDialog(
          context,
          DialogType.error,
          'Data Tidak Ditemukan',
          'Data pengguna tidak tersedia di Firestore.',
        );
      }
    } else {
      _showDialog(
        context,
        DialogType.error,
        'Login Gagal',
        authResult,
      );
    }
  } catch (e) {
    _showDialog(
      context,
      DialogType.error,
      'Kesalahan',
      'Terjadi kesalahan saat login: $e',
    );
  }
}

  static void _showDialog(
    BuildContext context,
    DialogType type,
    String title,
    String desc,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: type,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
    ).show();
  }
}
