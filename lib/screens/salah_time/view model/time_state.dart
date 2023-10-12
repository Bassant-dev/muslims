part of 'time_cubit.dart';

@immutable
abstract class TimeState {}

class TimeInitial extends TimeState {}
class GetCurrentLocationSuccess extends TimeState {}
class CurrentLocationLoading extends TimeState {}

class GetCurrentLocationFailed extends TimeState {}
class GetPrayerTimeSuccess extends TimeState {}
class GetPrayerTimeFailed extends TimeState {}
class TimeLoading extends TimeState {}