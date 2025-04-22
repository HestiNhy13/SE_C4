<!-- resources/views/landing/partials/_navbar.blade.php -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <!-- Logo di sisi kiri -->
    <a class="navbar-brand fw-bold" href="{{ route('landing') }}">
      SportEase
    </a>

    <!-- Tombol toggle (responsive) -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain" aria-controls="navbarMain" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Menu di sisi kanan -->
    <div class="collapse navbar-collapse" id="navbarMain">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

      <!-- HOME -->
      <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('landing') }}">Home</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('landing') ? 'active' : '' }}" 
             href="{{ route('landing') }}">
            Home
          </a>
        </li>
        <!-- EVENTS -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('events.index') }}">Events</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('events.index') ? 'active' : '' }}" 
             href="{{ route('events.index') }}">
            Events
          </a>
        </li>
        <!-- ABOUT -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('about') }}">About</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('about') ? 'active' : '' }}" 
             href="{{ route('about') }}">
            About
          </a>
        </li>
        <!-- CONTACT -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('contact') }}">Contact</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('contact') ? 'active' : '' }}" 
             href="{{ route('contact') }}">
            Contact
          </a>
        </li>
        <!-- CREATE EVENT -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('events.create') }}">Create Event</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('events.create') ? 'active' : '' }}" 
             href="{{ route('events.create') }}">
            Create Event
          </a>
        </li>
        <!-- LOGIN -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="{{ route('login') }}">Login</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link {{ request()->routeIs('login') ? 'active' : '' }}" 
             href="{{ route('login') }}">
            Login
          </a>
        </li>
        <!-- SIGN UP Selalu Kuning -->
        <!-- <li class="nav-item">
          <a class="btn btn-warning text-dark px-3 ms-2" href="{{ route('signup') }}">
            Sign Up
          </a>
        </li> -->
        <li class="nav-item">
          <a class="btn btn-warning text-dark px-3 ms-2 {{ request()->routeIs('signup') ? 'active' : '' }}" 
             href="{{ route('signup') }}">
            Sign Up
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

        <!-- <li class="nav-item">
          <a class="nav-link active" href="{{ route('landing') }}">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Events</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li> -->
        <!-- Buat pemisah kecil -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="#">Create Event</a>
        </li> -->
        <!-- Login dan Signup -->
        <!-- <li class="nav-item">
          <a class="nav-link" href="#">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav btn btn-warning text-dark px-3 ms-2" href="#">Sign Up</a>
        </li>
      </ul>
    </div>
  </div>
</nav> -->