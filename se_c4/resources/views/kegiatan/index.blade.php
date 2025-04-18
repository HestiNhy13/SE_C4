@extends('layouts.app')

@section('content')
<style>
    /* Custom CSS untuk desain menarik */
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background: #f8f9fa;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h2 {
        color: #2c3e50;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .btn-primary {
        background: #007bff;
        border: none;
        padding: 10px 20px;
        font-weight: bold;
        transition: all 0.3s ease;
        border-radius: 25px;
    }

    .btn-primary:hover {
        background: #0056b3;
        transform: translateY(-2px);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    .table {
        background: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin-left: 5px; /* Jarak 5px dari sisi kiri */
        margin-right: 5px; /* Jarak 5px dari sisi kanan */
    }

    .table thead {
        background: linear-gradient(45deg, #007bff, #00d4ff);
        color: #fff;
        text-transform: uppercase;
        font-size: 14px;
    }

    .table th, .table td {
        padding: 15px;
        vertical-align: middle;
        text-align: center;
        border: none;
    }

    .table tbody tr {
        transition: all 0.3s ease;
    }

    .table tbody tr:hover {
        background: #e9f7ff;
        transform: scale(1.01);
    }

    .table tbody tr td {
        font-size: 15px;
        color: #34495e;
    }

    .btn-warning, .btn-danger {
        border-radius: 50%;
        width: 40px;
        height: 40px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        margin: 0 5px;
        transition: all 0.3s ease;
    }

    .btn-warning:hover, .btn-danger:hover {
        transform: translateY(-2px);
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    .badge {
        font-size: 14px;
        padding: 8px 12px;
        border-radius: 20px;
        display: inline-block;
    }

    /* Jarak tombol Tambah Data dengan tabel */
    .tambah-data {
        margin-bottom: 5px; /* Jarak 5px antara tombol dan tabel */
    }

    /* Responsif */
    @media (max-width: 768px) {
        .table {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
            margin-left: 0; /* Reset margin untuk layar kecil agar penuh */
            margin-right: 0;
        }

        .btn-primary {
            width: 100%;
            text-align: center;
        }
    }
</style>

<div class="container">
    <h1>Kelola Kegiatan</h1>
    <a href="{{ route('kegiatan.create') }}" class="btn btn-primary tambah-data">+ Tambah Data</a>
    <table class="table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama Olahraga</th>
                <th>Deskripsi</th>
                <th>Jadwal</th>
                <th>Waktu</th>
                <th>Pelatih</th>
                <th>Tempat</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($kegiatan as $item)
            <tr>
                <td>{{ $item->id }}</td>
                <td><span class="badge bg-primary">{{ $item->nama_olahraga }}</span></td>
                <td>{{ $item->deskripsi ?? 'Tidak ada deskripsi' }}</td>
                <td>{{ \Carbon\Carbon::parse($item->jadwal)->translatedFormat('l, d/m/Y') }}</td>
                <td>{{ $item->waktu }} WIB</td>
                <td><span class="badge bg-success">{{ $item->pelatih }}</span></td>
                <td>{{ $item->tempat }}</td>
                <td>
                    <a href="{{ route('kegiatan.edit', $item->id) }}" class="btn btn-warning btn-sm" title="Edit">✏️</a>
                    <form action="{{ route('kegiatan.destroy', $item->id) }}" method="POST" style="display:inline" onsubmit="return confirm('Yakin ingin menghapus data ini?');">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-danger btn-sm" title="Hapus">🗑️</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="8" class="text-center text-muted py-4">Belum ada data kegiatan.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection