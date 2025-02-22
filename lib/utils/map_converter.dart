Map<String, dynamic> convertMap(Map<dynamic, dynamic> map) {
  return map.map((key, value) {
    if (value is Map) {
      return MapEntry(key.toString(), convertMap(value));
    } else if (value is List) {
      return MapEntry(
        key.toString(),
        value.map((item) => item is Map ? convertMap(item) : item).toList(),
      );
    } else {
      return MapEntry(key.toString(), value);
    }
  });
}
