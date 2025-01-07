String truncateString(String? value, {int length = 20}) {
  if (value != null && value.length > length) {
    return "${value.substring(0, length)}...";
  } else {
    return value ?? '';
  }
}
