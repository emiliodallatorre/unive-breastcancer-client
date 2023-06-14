// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predict_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictRequestModel _$PredictRequestModelFromJson(Map<String, dynamic> json) =>
    PredictRequestModel(
      radius: (json['radius'] as num).toDouble(),
      perimeter: (json['perimeter'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
    );

Map<String, dynamic> _$PredictRequestModelToJson(
        PredictRequestModel instance) =>
    <String, dynamic>{
      'radius': instance.radius,
      'perimeter': instance.perimeter,
      'area': instance.area,
    };
