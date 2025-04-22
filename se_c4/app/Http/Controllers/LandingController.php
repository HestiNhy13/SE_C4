<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LandingController extends Controller
{
    public function index()
    {
        // Anda dapat mengambil data dari database, misal daftar event dan kategori olahraga.
        // Untuk contoh ini kita hardcode beberapa data.

        $upcomingEvents = [
            [
                'title' => 'Concert & Music Fest',
                'image' => 'events/concert.jpg',
                'date'  => '12 April 2025'
            ],
            [
                'title' => 'Startup Workshop',
                'image' => 'events/workshop.jpg',
                'date'  => '18 April 2025'
            ],
            [
                'title' => 'Charity Run',
                'image' => 'events/charity.jpg',
                'date'  => '25 April 2025'
            ],
        ];

        $sportsCategories = [
            [
                'name' => 'Sepak Bola',
                'image' => 'sports/soccer.jpg'
            ],
            [
                'name' => 'Basket',
                'image' => 'sports/basketball.jpg'
            ],
            [
                'name' => 'Bulu Tangkis',
                'image' => 'sports/badminton.jpg'
            ],
            [
                'name' => 'Lari',
                'image' => 'sports/running.jpg'
            ],
        ];

        return view('landing.index', compact('upcomingEvents', 'sportsCategories'));
    }

    // untuk fungsi search
    public function search(Request $request)
{
    $keyword = $request->get('q'); // Ambil input pencarian "q"

    // CONTOH: Jika Anda ingin mencari di array statis atau di DB.
    // Misal, kita buat array event statis (nanti kembangkan pakai DB).
    $allEvents = [
        ['title' => 'Concert & Music Fest', 'date' => '12 April 2025'],
        ['title' => 'Startup Workshop', 'date' => '18 April 2025'],
        ['title' => 'Charity Run', 'date' => '25 April 2025'],
        // ... data lainnya
    ];

    // Filter data secara sederhana (jika judul mengandung keyword)
    $results = array_filter($allEvents, function ($event) use ($keyword) {
        return stripos($event['title'], $keyword) !== false;
    });

    // Lalu lempar ke view
    return view('landing.search-result', compact('results', 'keyword'));
}

}
