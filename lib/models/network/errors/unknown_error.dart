class UnknownError implements Exception {
  const UnknownError();

  @override
  String toString() {
    return 'Unknown error';
  }
}
