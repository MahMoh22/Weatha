import 'package:json_annotation/json_annotation.dart';
part 'search_response.g.dart';

@JsonSerializable()
class SearchItemResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'region')
  String? region;
  @JsonKey(name: 'country')
  String? country;
  SearchItemResponse({
    this.name,
    this.region,
    this.country,
  });
  //from json
  factory SearchItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchItemResponseFromJson(json);
  //to json
  Map<String, dynamic> toJson() => _$SearchItemResponseToJson(this);
}

@JsonSerializable()
class SearchResponse {
  List<SearchItemResponse>? searchList;
  SearchResponse({
    this.searchList,
  });
  //from json
  factory SearchResponse.fromJson(List<dynamic>? json) =>
      _$SearchResponseFromJson(json);

}
/*
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

*/ 