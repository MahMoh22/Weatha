// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemResponse _$SearchItemResponseFromJson(Map<String, dynamic> json) =>
    SearchItemResponse(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SearchItemResponseToJson(SearchItemResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
    };

SearchResponse _$SearchResponseFromJson(List<dynamic>? json) => SearchResponse(
      searchList: json
          ?.map((e) => SearchItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
