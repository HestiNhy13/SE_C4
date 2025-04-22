<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function showLoginForm()
    {
        return view('landing.login');
    }

    public function login(Request $request)
    {
        // Contoh penanganan login: validasi user
        // if (Auth::attempt(...)) ...
        return redirect()->route('landing')
                         ->with('success', 'Logged in successfully!');
    }

    public function showRegisterForm()
    {
        return view('landing.signup');
    }

    public function register(Request $request)
    {
        // Simpan user baru ke DB
        return redirect()->route('login')
                         ->with('success', 'Account created! Please login.');
    }
}