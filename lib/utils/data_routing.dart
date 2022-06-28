class DataRouting {
  final String route;
  final Map<String, String> _queryParameters;

  DataRouting(this.route, Map<String, String> queryParameters)
      : _queryParameters = queryParameters;
  operator [](String key) => _queryParameters[key];
}
