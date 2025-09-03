class CampaignSearchRequest {
  final String keyword;
  final int page;
  final int limit;
  final List<String> filters;
  final String? sortBy;
  final String? sortOrder;

  CampaignSearchRequest({
    required this.keyword,
    this.page = 1,
    this.limit = 10,
    this.filters = const [],
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    return {
      'keyword': keyword,
      'page': page,
      'limit': limit,
      'filters': filters,
      if (sortBy != null) 'sortBy': sortBy,
      if (sortOrder != null) 'sortOrder': sortOrder,
    };
  }

  CampaignSearchRequest copyWith({
    String? keyword,
    int? page,
    int? limit,
    List<String>? filters,
    String? sortBy,
    String? sortOrder,
  }) {
    return CampaignSearchRequest(
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      filters: filters ?? this.filters,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
