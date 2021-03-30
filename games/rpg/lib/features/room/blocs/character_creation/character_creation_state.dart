part of 'character_creation_cubit.dart';

class CharacterCreationState extends Equatable {
  final Class job;
  final ConsumableItem startingItem;
  final String name;
  final FormzStatus status;

  CharacterCreationState({
    this.job,
    this.startingItem,
    this.name="",
    this.status = FormzStatus.pure,
  });

  copyWith({
    job,
    startingItem,
    name,
    status,
  }) =>
      CharacterCreationState(
        job: job ?? this.job,
        startingItem: startingItem ?? this.startingItem,
        name: name ?? this.name,
        status:status??this.status,
      );

  @override
  List<Object> get props => [
        job,
        startingItem,
        name,
        status,
      ];
}
