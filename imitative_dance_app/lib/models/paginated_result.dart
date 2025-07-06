class PaginatedResult<T> {
  final List<T> items;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  PaginatedResult({
    required this.items,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
  });
}
