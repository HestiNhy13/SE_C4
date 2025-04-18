{{-- resources/views/kegiatan/create.blade.php --}}
@extends('layouts.app')

@section('title', 'Tambah Kegiatan')

@section('content')
    <h2>Tambah Kegiatan Olahraga</h2>

    <form action="{{ route('kegiatan.store') }}" method="POST">
        @csrf
        <label>Nama Olahraga:</label><br>
        <input type="text" name="nama_olahraga" required><br><br>

        <label>Deskripsi:</label><br>
        <textarea name="deskripsi" rows="4"></textarea><br><br>

        <label>Status:</label><br>
        <select name="status" required>
            <option value="pelajar">Pelajar</option>
            <option value="umum">Umum</option>
        </select><br><br>

        <label>Jadwal:</label><br>
        <input type="text" name="jadwal"><br><br>

        <label>Lokasi:</label><br>
        <input type="text" name="lokasi_olahraga"><br><br>

        <label>Pelatih:</label><br>
        <input type="text" name="pelatih"><br><br>

        <button type="submit">Simpan</button>
    </form>
@endsection
