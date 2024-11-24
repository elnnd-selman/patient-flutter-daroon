extension NullCheckString on String? {
  String get nullCheck {
    return this ?? '---';
  }
}
