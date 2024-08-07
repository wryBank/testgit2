class ErrorResponseModel {
  String? timestamp;
  String? path;
  String? message;
  int? statusCode;

  ErrorResponseModel({
    required this.timestamp,
    required this.path,
    required this.message,
    required this.statusCode,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      timestamp: json["timestamp"],
      path: json["path"],
      message: json["message"],
      statusCode: 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "timestamp": timestamp,
      "path": path,
      "message": message,
      "statusCode": statusCode,
    };
  }
}
