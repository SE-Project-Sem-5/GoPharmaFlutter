import 'card_type.dart';

class Visa extends CardType {
  String image = "images/visa.png";

  @override
  bool hasFullMatch(String? cardNumber) {
    return CardType.fullPatternVisa.hasMatch(cardNumber!);
  }

  @override
  bool hasStartingMatch(String? cardNumber) {
    return cardNumber!.startsWith(CardType.startingPatternVisa);
  }

  @override
  String toString() {
    return CardType.visa;
  }

  @override
  String getImage() {
    return this.image;
  }
}
