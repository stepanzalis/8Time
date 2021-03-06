import 'package:eighttime/src/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object> get props => [];
}

class ActivitiesLoading extends ActivitiesState {}

class ActivitiesLoaded extends ActivitiesState {
  final List<Activity> activities;

  const ActivitiesLoaded([this.activities = const []]);

  @override
  List<Object> get props => [activities];

  @override
  String toString() => 'ActivitiesLoaded { activities: $activities }';
}

class ActivitiesNotLoaded extends ActivitiesState {}
