class UniversalModel {
  dynamic data;
  int statusCode;
  String error;

  UniversalModel({
    this.data,
    this.error = '',
    this.statusCode = 0,
  });
}
