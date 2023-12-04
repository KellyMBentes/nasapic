sealed class PictureException implements Exception {}

class CacheException extends PictureException {}

class ServiceUnavaiableException extends PictureException {}
