import 'package:json_annotation/json_annotation.dart';

part 'predict_response_model.g.dart';

@JsonSerializable()
class PredictResponseModel {
  String diagnosis;
  Map<String, double> probabilities;

  PredictResponseModel({
    required this.diagnosis,
    required this.probabilities,
  });

  factory PredictResponseModel.fromJson(Map<String, dynamic> json) => _$PredictResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PredictResponseModelToJson(this);
}
