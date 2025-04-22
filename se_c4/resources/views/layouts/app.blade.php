<!-- resources/views/layouts/app.blade.php -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>SportEase - Laravel 12 Landing Page</title>
    <meta name="description" content="Landing Page Events dengan Laravel 12, menampilkan event mendatang & kategori olahraga">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Contoh pakai Bootstrap 5 via CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- (Opsional) Tambah custom CSS -->
    <style>
        /* Contoh styling background hero */
        .hero-section {
            background: url('/images/hero-bg.jpg') center center / cover no-repeat;
            min-height: 400px;
            color: #fff;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .hero-overlay {
            background-color: rgba(0, 0, 0, 0.4);
            position: absolute;
            top: 0; right: 0; bottom: 0; left: 0;
        }
        .hero-content {
            position: relative;
            z-index: 1;
        }
        .vertical-sports img {
            width: 100%;
            height: auto;
        }
        .nav-link {
            position: relative;
        }
        .nav-link.active {
            position: relative; 
            border-bottom: 3px solid #FFD426; /* contoh warna kuning */
        }
        .nav-link.active::after {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  bottom: -4px; /* Jarak antara teks & garis */
  height: 3px;
  background-color: #FFD426; /* Warna kuning */
  margin: 0 auto;
  width: 100%;
}
.nav-link::after {
  transition: all 0.3s ease;
}

    </style>

    @stack('styles') 
    <!-- Memungkinkan penambahan style khusus di child blade -->
</head>
<body>
    <!-- NAVBAR -->
    @include('landing.partials._navbar')

    <!-- MAIN CONTENT -->
    <main>
        @yield('content')
    </main>

    <!-- FOOTER -->
    @include('landing.partials._footer')

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    @stack('scripts')
</body>
</html>