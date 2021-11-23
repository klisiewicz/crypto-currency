class CoinMarketCapApiKeyNotFoundError extends Error {
  final String? message;

  CoinMarketCapApiKeyNotFoundError([this.message]);

  @override
  String toString() => message ?? 'CoinMarketCap API key not found';
}
