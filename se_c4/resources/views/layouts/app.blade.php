<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'SportEase')</title>

    {{-- Tambahkan CSS dari Laravel Mix atau CDN jika ada --}}
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #0d6efd;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }

        main {
            padding: 2rem;
        }

        footer {
            background-color: #eee;
            padding: 1rem;
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>

    <header>
        <h1>SportEase Admin Panel</h1>
    </header>

    <main>
        @yield('content')
    </main>

    <footer>
        &copy; {{ date('Y') }} SportEase. All rights reserved.
    </footer>

</body>
</html>
