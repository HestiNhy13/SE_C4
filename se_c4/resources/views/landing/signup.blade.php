<!-- resources/views/landing/signup.blade.php -->
@extends('layouts.app')

@section('content')
<div class="container py-5">
  <h2>Sign Up</h2>
  <form action="{{ route('signup.submit') }}" method="POST">
    @csrf
    <div class="mb-3">
      <label class="form-label">Name</label>
      <input type="text" name="name" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button class="btn btn-primary">Register</button>
  </form>
</div>
@endsection