import 'package:equatable/equatable.dart';

class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object?> get props => [];
}

class ItemInitial extends ItemState {}
class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<String> items;

  const ItemLoaded({this.items = const []});

  ItemLoaded copyWith({List<String>? value}) => ItemLoaded(
      items: value ?? items
  );

  @override
  List<Object?> get props => [items];
}

class ItemError extends ItemState {
  final String message;

  const ItemError({required this.message});

  ItemError copyWith(String? value) => ItemError(
      message: value ?? message
  );

  @override
  List<Object?> get props => [message];
}
