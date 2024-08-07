abstract class AppEvent {}

abstract class AppState {}

class StateInitial extends AppState {
  @override
  String toString() {
    return 'StateInitial';
  }
}

class StateLoading extends AppState {
  @override
  String toString() {
    return 'StateLoading';
  }
}

class StateError extends AppState {
  final String message;
  StateError(this.message);
  @override
  String toString() {
    return 'StateLoading';
  }
}
