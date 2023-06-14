// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictResponseModel _$PredictResponseModelFromJson(
        Map<String, dynamic> json) =>
    PredictResponseModel(
      diagnosis: json['diagnosis'] as String,
      probabilities: (json['probabilities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$PredictResponseModelToJson(
        PredictResponseModel instance) =>
    <String, dynamic>{
      'diagnosis': instance.diagnosis,
      'probabilities': instance.probabilities,
    };
