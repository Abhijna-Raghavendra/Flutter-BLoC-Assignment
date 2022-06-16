class BinaryModel {
  String? status;
  String? original;
  String? converted;
  String? from;
  String? to;
  String? error;

  BinaryModel({this.status, this.original, this.converted, this.from, this.to});

  BinaryModel.withError(String errorMessage) {
    error = errorMessage;
  }

  BinaryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    original = json['original'];
    converted = json['converted'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['original'] = original;
    data['converted'] = converted;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
