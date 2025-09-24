class ItemRepository {
  const ItemRepository();

  Future<List<String>> fetchItemList() async {
    await Future.delayed(Duration(seconds: 2));
    List<String> item = List.generate(10, (index) {
      return "Item $index";
    });
    return item;
  }
}
