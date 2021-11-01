class ResponseModel {
  bool status;
  String msg;
  int httpCode;
  dynamic data;

  ResponseModel({
    required this.status,
    required this.msg,
    this.data,
    required this.httpCode
  });

 
  factory ResponseModel.fromJson(Map<String, dynamic> json, dynamic data, int code) => ResponseModel(
    status: json["status"],
    msg: json["msg"] != null ? json["msg"] : json["message"],
    httpCode: code,
    data: data,
  );
}
