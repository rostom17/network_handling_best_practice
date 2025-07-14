class NetworkRequestModel {
  final String path;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final dynamic body;
  final String? contentType;
  final bool requiresAuth;
  final Duration? customTimeout;

  const NetworkRequestModel({
    required this.path,
    this.queryParams,
    this.headers,
    this.body,
    this.contentType,
    this.requiresAuth = false,
    this.customTimeout,
  });

  NetworkRequestModel copyWith({
    String? path,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    dynamic body,
    String? contentType,
    bool? requiresAuth,
    Duration? customTimeout,
  }) {
    return NetworkRequestModel(
      path: path ?? this.path,
      queryParams: queryParams ?? this.queryParams,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      contentType: contentType ?? this.contentType,
      requiresAuth: requiresAuth ?? this.requiresAuth,
      customTimeout: customTimeout ?? this.customTimeout,
    );
  }
}
