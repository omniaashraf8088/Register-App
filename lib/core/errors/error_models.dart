class ErrorModels {
  final  int statusCode;
   final String errorMessage;
   ErrorModels({required this.errorMessage,required this.statusCode});


ErrorModels.fromJson(Map<String, dynamic> json)
      : errorMessage = json['errorMessage'],
        statusCode = json['statusCode'];

  Map<String, dynamic> toJson() => {
        'errorMessage': errorMessage,
        'statusCode': statusCode,
      };
}