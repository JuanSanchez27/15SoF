class TokenExpiredException implements Exception {
  const TokenExpiredException();

  @override
  String toString() {
    return 'The token has been expired';
  }
}
