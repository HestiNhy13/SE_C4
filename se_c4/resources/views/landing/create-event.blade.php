@extends('layouts.app')

@section('content')
<div class="container py-5">
  <h2>Create an Event</h2>
  <form action="{{ route('events.store') }}" method="POST">
    @csrf
    <div class="mb-3">
      <label for="title" class="form-label">Event Title</label>
      <input type="text" name="title" id="title" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="date" class="form-label">Date</label>
      <input type="date" name="date" id="date" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Create</button>
  </form>
</div>
@endsection