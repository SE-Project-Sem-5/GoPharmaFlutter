import 'card_types/card_type.dart';
import 'card_types/mastercard.dart';
import 'card_types/visa.dart';

class PaymentCard {
  final Map<String, CardType> cardTypes = {
    "Visa": Visa(),
    "MasterCard": MasterCard(),
  };

  CardType? _cardType;
  String? _name;
  String? _number;
  String? _cvc;
  int? _expiryMonth;
  int? _expiryYear;
  String? _lastFourDigits;

  PaymentCard(
    this._name,
    this._number,
    this._cvc,
    this._expiryMonth,
    this._expiryYear,
  ) {
    if ((cardTypes["Visa"])!.hasFullMatch(_number)) {
      _cardType = cardTypes["Visa"];
    }
    if ((cardTypes["MasterCard"])!.hasFullMatch(_number)) {
      _cardType = cardTypes["MasterCard"];
    }
  }

  String? get lastFourDigits => _lastFourDigits;

  set lastFourDigits(String? value) {
    _lastFourDigits = this.number!.substring(this.number!.length - 4);
  }

  int? get expiryYear => _expiryYear;

  int? get expiryMonth => _expiryMonth;

  String? get cvc => _cvc;

  String? get number => _number;

  String? get name => _name;

  CardType? get cardType => _cardType;

//TODO:  need to add validation to check if card is valid
//https://github.com/wilburt/flutter_paystack/blob/master/lib/src/models/card.dart
}
