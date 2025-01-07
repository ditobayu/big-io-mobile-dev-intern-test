import 'package:floor/floor.dart';

class StringListConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) {
    if (databaseValue == null || databaseValue.isEmpty) {
      return null;
    }
    return databaseValue.split(',');
  }

  @override
  String? encode(List<String>? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return value.join(',');
  }
}
