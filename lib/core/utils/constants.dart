// coverage:ignore-file

abstract class Constants {
  static const String apiURL = String.fromEnvironment('URL');
  static const String apiKey = String.fromEnvironment('API_KEY');

  static const String catBreedsEndpoint = 'breeds';
  static const String catBreedsSearchEndpoint = 'breeds/search';
}
