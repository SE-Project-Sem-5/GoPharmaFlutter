abstract class CardType {
  // Card types
  static const String visa = "Visa";
  static const String masterCard = "MasterCard";
  static const String unknown = "Unknown";

  static final int maxLengthNormal = 16;

  static final fullPatternVisa = RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$');
  static final fullPatternMasterCard = RegExp(
      r'^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$');

  static final startingPatternVisa = RegExp(r'[4]');
  static final startingPatternMasterCard = RegExp(
      r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))');

  bool hasFullMatch(String? cardNumber);

  bool hasStartingMatch(String? cardNumber);

  @override
  String toString();

  String getImage();
}
