class NotificationSearchRequest {
  final int page;
  final int size;

  NotificationSearchRequest({required this.page, required this.size});

  Map<String, dynamic> toJson() {
    return {'page': page, 'size': size};
  }

  NotificationSearchRequest copyWith({int? page, int? size}) {
    return NotificationSearchRequest(page: page ?? this.page, size: size ?? this.size);
  }
}
