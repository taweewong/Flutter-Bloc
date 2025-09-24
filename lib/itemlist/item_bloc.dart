import 'package:bloc_learning/itemlist/item_event.dart';
import 'package:bloc_learning/itemlist/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_repository.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository repository;

  ItemBloc({required this.repository}) : super(ItemState()) {
    on<FetchItemEvent>(_onFetchItem);
  }

  void _onFetchItem(
    FetchItemEvent event,
    Emitter<ItemState> emit,
  ) async {
    emit(ItemLoading());
    try {
      List<String> results = await repository.fetchItemList();
      emit(ItemLoaded(items: results));
    } catch (e) {
      emit(ItemError(message: e.toString()));
    }
  }
}
