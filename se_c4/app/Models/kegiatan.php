<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kegiatan extends Model
{
    protected $table = 'kegiatan';

    protected $fillable = [
        'nama_olahraga',
        'deskripsi',
        'jadwal',
        'waktu',
        'pelatih',
        'tempat'
    ];
}
