import 'package:bloc_learning/itemlist/item_bloc.dart';
import 'package:bloc_learning/itemlist/item_event.dart';
import 'package:bloc_learning/itemlist/item_repository.dart';
import 'package:bloc_learning/itemlist/item_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'item_bloc_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  group("Test Item Bloc Test", () {
    ItemRepository repository = MockItemRepository();

    setUp(() {
      when(
        repository.fetchItemList(),
      ).thenAnswer((_) async => ['mock1', 'mock2']);
    });

    blocTest(
      "Emit data when fetch success",
      build: () => ItemBloc(repository: repository),
      act: (bloc) {
        bloc.add(FetchItemEvent());
      },
      expect: () => [
        ItemLoading(),
        ItemLoaded(items: ['mock1', 'mock2'])
      ],
    );
  });
}
