extension IterableExtensions on Iterable {
  /// Split an iterable in lists of [chunkSize]
  Iterable<List<T>> chunked<T>(int chunkSize) sync* {
    if (chunkSize <= 0) {
      throw ArgumentError('chunkSize deve ser maior que 0.');
    }

    final iterator = this.iterator;

    while (iterator.moveNext()) {
      final chunk = <T>[];

      do {
        chunk.add(iterator.current);
      } while (chunk.length < chunkSize && iterator.moveNext());

      yield chunk;
    }
  }
}
