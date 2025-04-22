<?php

//use Illuminate\Support\Facades\Route;
//use App\Http\Controllers\LandingController;

//Route::get('/', [LandingController::class, 'index'])->name('landing');

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LandingController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\AuthController;

// 1) Home -> Landing Page
Route::get('/', [LandingController::class, 'index'])->name('landing');

// 2) Events -> Halaman daftar event
Route::get('/events', [EventController::class, 'index'])->name('events.index');

// 3) About -> Halaman statis "About"
Route::view('/about', 'landing.about')->name('about');

// 4) Contact -> Halaman statis "Contact"
Route::view('/contact', 'landing.contact')->name('contact');

// 5) Create Event -> Form pembuatan event
Route::get('/create-event', [EventController::class, 'create'])->name('events.create');
Route::post('/create-event', [EventController::class, 'store'])->name('events.store');

// 6) Login dan Sign Up
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login'])->name('login.submit');

Route::get('/signup', [AuthController::class, 'showRegisterForm'])->name('signup');
Route::post('/signup', [AuthController::class, 'register'])->name('signup.submit');

// 7) Search -> Pencarian event / olahraga
Route::get('/search', [LandingController::class, 'search'])->name('search');
