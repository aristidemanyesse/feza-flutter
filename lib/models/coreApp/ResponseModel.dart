class ResponseModel {
  bool ok;
  String? field;
  String? message;
  dynamic data;

  ResponseModel({required this.ok, this.field, this.message, this.data});

  Map<String, dynamic> toJson() =>
      {"ok": ok, "field": field, "message": message, "data": data};
}
