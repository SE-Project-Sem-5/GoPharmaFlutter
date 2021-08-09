import 'card_type.dart';

class MasterCard extends CardType {
  String image = "images/mastercard.png";

  @override
  bool hasFullMatch(String? cardNumber) {
    return CardType.fullPatternMasterCard.hasMatch(cardNumber!);
  }

  @override
  bool hasStartingMatch(String? cardNumber) {
    return cardNumber!.startsWith(CardType.startingPatternMasterCard);
  }

  @override
  String toString() {
    return CardType.masterCard;
  }

  @override
  String getImage() {
    return this.image;
  }
}
