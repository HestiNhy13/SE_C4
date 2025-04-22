<!-- resources/views/landing/index.blade.php -->
@extends('layouts.app')

@section('content')

<!-- HERO / BAGIAN ATAS DENGAN BACKGROUND + SEARCH BAR -->
<section class="hero-section position-relative">
  <div class="hero-overlay"></div>
  <div class="hero-content text-center">
    <h1 class="fw-bold">Olahraga Saya</h1>
    <p class="lead mb-4">Explore the vibrant events happening locally and globally</p>

    <!-- SEARCH FORM -->

    <!-- <div class="d-flex justify-content-center"> -->
      <form action="{{ route('search') }}" method="GET"> 
      <div class="input-group" style="max-width: 500px;">
        <input type="text" class="form-control" placeholder="Search Events, Categories, Location...">
        <button class="btn btn-primary">Search</button>
      </div>
    </div>
  </div>
</section>

<!-- SECTION: UPCOMING EVENTS (3 Gambar) -->
<section class="py-5">
  <div class="container">
    <h2 class="text-center mb-4">Upcoming Events</h2>
    <div class="row">
      @foreach($upcomingEvents as $event)
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="{{ asset('images/' . $event['image']) }}" class="card-img-top" alt="{{ $event['title'] }}">
            <div class="card-body">
              <h5 class="card-title">{{ $event['title'] }}</h5>
              <p class="card-text">Date: {{ $event['date'] }}</p>
            </div>
          </div>
        </div>
      @endforeach
    </div>
  </div>
</section>

<!-- SECTION: SPORTS CATEGORIES (Secara Vertikal) -->
<section class="py-5 bg-light">
  <div class="container">
    <h2 class="text-center mb-4">Popular Sports</h2>
    <div class="vertical-sports row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
      @foreach($sportsCategories as $sports)
        <div class="col">
          <div class="card h-100 text-center">
            <img src="{{ asset('images/' . $sports['image']) }}" class="card-img-top" alt="{{ $sports['name'] }}">
            <div class="card-body">
              <h5 class="card-title">{{ $sports['name'] }}</h5>
            </div>
          </div>
        </div>
      @endforeach
    </div>
  </div>
</section>

@endsection