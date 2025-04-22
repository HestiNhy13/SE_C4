@extends('layouts.app')

@section('content')
<div class="container py-5">
  <h2 class="mb-4">Search Results for: "{{ $keyword }}"</h2>
  @if(count($results) > 0)
    <ul class="list-group">
      @foreach($results as $event)
        <li class="list-group-item">
          <strong>{{ $event['title'] }}</strong>
          <br>
          Date: {{ $event['date'] }}
        </li>
      @endforeach
    </ul>
  @else
    <p>No results found for "{{ $keyword }}"</p>
  @endif
</div>
@endsection