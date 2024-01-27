part of 'results_cubit.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();

  @override
  List<Object> get props => [];
}

class ResultsInitial extends ResultsState {}

class ResultsLoading extends ResultsState {}

class ResultsError extends ResultsState {
  const ResultsError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ResultsSuccess extends ResultsState {
  const ResultsSuccess(this.results);

  final List<Result> results;

  @override
  List<Object> get props => [results];
}
