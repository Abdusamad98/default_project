part of 'my_equatable_cubit.dart';

class MyEquatableState extends Equatable {
  MyEquatableState({required this.name});

  final String name;

  MyEquatableState copyWith(
    String? name,
  ) {
    return MyEquatableState(name: name ?? this.name);
  }

  @override
  List<Object> get props => [name];
}
