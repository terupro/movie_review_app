class CustomException implements Exception {
  final String? message;
  const CustomException({this.message = 'システムに問題が発生しました。'});
  @override
  String toString() => '$message';
}
