import 'package:flutter/material.dart';
import 'package:sport_ease/presentation/screen/login_screen.dart';
import 'package:sport_ease/presentation/widget/custom_button.dart';
import '../widget/custom_card.dart';
import '../screen/home_screen.dart';
import '../widget/custom_text.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Icon Back
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Custom Card (Form)
                CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'REGISTER',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Lengkapi data diri Anda!',
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 20),

                        // Nama Lengkap
                        const Text('Nama Lengkap'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan Nama Lengkap",
                          controller: nameController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                        ),
                        const SizedBox(height: 12),

                        // Email
                        const Text('Email'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan Email",
                          controller: emailController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                        ),
                        const SizedBox(height: 12),

                        // No. Telp
                        const 
                        Text('No. Telepon'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan No. Telepon",
                          controller: phoneController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                        ),
                        const SizedBox(height: 12),

                        // Alamat
                        const Text('Alamat'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan Alamat",
                          controller: addressController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                        ),
                        const SizedBox(height: 12),

                        // Password
                        const Text('Password'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan Password",
                          controller: passwordController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                          obscureText: !_isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Konfirmasi Password
                        const Text('Konfirmasi Password'),
                        const SizedBox(height: 6),
                        CustomTextField(
                          hintText: "Masukkan Konfirmasi Password",
                          controller: confirmPasswordController,
                          borderColor: Colors.black,
                          fillColor: Colors.white60,
                          obscureText: !_isConfirmPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 24),

                        Center(
                          child: CustomButton(
                            text: 'DAFTAR',
                            color: Colors.blue.shade900,
                            borderColor: Colors.black,
                            onPressed: () {
                              // Aksi setelah daftar
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
