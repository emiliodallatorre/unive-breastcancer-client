import 'package:json_annotation/json_annotation.dart';

part 'predict_request_model.g.dart';

@JsonSerializable()
class PredictRequestModel {
  double radius, perimeter, area;

  PredictRequestModel({
    required this.radius,
    required this.perimeter,
    required this.area,
  });

  factory PredictRequestModel.fromJson(Map<String, dynamic> json) => _$PredictRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PredictRequestModelToJson(this);
}
