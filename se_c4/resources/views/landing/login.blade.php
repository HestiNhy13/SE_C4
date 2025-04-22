<!-- resources/views/landing/login.blade.php -->
@extends('layouts.app')

@section('content')
<div class="container py-5">
  <h2>Login</h2>
  <form action="{{ route('login.submit') }}" method="POST">
    @csrf
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button class="btn btn-primary">Login</button>
  </form>
</div>
@endsection