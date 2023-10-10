part of 'stories_cubit.dart';

@immutable
abstract class StoriesState {}

class StoriesInitial extends StoriesState {}
class StoryOpen extends StoriesState {}
class StoriesSuccess extends StoriesState {}
class StoryshareSuccess extends StoriesState {}