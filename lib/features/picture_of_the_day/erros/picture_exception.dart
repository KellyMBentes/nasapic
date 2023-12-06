sealed class PictureException implements Exception {}

class CacheException extends PictureException {}

class ServerException extends PictureException {}

class NoInternetConnectionException extends PictureException {}
