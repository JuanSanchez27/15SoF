import 'package:equatable/equatable.dart';

class ResultState<T, E> extends Equatable {
  final T? data;
  final E? error;
  final bool isLoading;
  final bool initial;

  const ResultState({
    T? data,
    E? error,
    this.isLoading = false,
    this.initial = false,
  })  : data = data,
        error = error;

  factory ResultState.data(T d) => ResultState(data: d);

  factory ResultState.error(E e) => ResultState(error: e);

  factory ResultState.initial() => const ResultState(initial: true);

  factory ResultState.loading() => const ResultState(isLoading: true);

  ResultState<T, E> copyWith({
    T? data,
    E? error,
    bool? isLoading,
    bool? initial,
  }) {
    return ResultState(
      data: data ?? this.data,
      error: error ?? this.error,
      initial: initial ?? this.initial,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        data,
        error,
        isLoading,
        initial,
      ];
}
