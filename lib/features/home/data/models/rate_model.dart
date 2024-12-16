class RateModel {
  final double rate;
  final int count;

  RateModel({required this.rate, required this.count});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(rate: json['rate'].toDouble(), count: json['count']);
  }
  tojson() {
    return {"rate": rate, "count": count};
  }
}
