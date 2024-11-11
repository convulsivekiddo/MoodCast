// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      date: _parseDate(json['dt_txt'] as String),
      temperature: _parseTemperature(json['main'] as Map<String, dynamic>),
      description: _parseDescription(json['weather'] as List),
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{
      'dt_txt': instance.date,
      'main': instance.temperature,
      'weather': instance.description,
    };
