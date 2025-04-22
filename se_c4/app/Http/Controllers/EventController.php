<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EventController extends Controller
{
    public function index()
    {
        // Ambil daftar event (contoh statis)
        $events = [
            ['title' => 'Concert & Music Fest', 'date' => '12 April 2025'],
            ['title' => 'Startup Workshop', 'date' => '18 April 2025'],
            // dan seterusnya ...
        ];
        return view('landing.events', compact('events'));
    }

    public function create()
    {
        // Tampilkan form pembuatan event
        return view('landing.create-event');
    }

    public function store(Request $request)
    {
        // Tangani data form pembuatan event
        // Contoh: $request->title, $request->date, dsb.
        // Lalu simpan ke DB. Di sini kita hanya contoh
        return redirect()->route('events.index')
                         ->with('success', 'Event created successfully!');
    }
}