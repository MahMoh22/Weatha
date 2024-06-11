import 'package:my_weather/features/home/data/models/search_response.dart';
import 'package:my_weather/features/home/domain/entities/search.dart';

extension SearchItemMapper on SearchItemResponse {
  Search toEntity() {
    return Search(name: name, region: region, country: country);
  }
}

extension SearchMapper on SearchResponse {
  List<Search> toEntity() {
    return searchList!.map((e) => e.toEntity()).toList();
  }
}
