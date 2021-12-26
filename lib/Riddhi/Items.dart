class Tag {
  String marathi;

  Tag(this.marathi);

  factory Tag.fromJson(dynamic json) {
    return Tag(json['marathi'] as String);
  }

  @override
  String toString() {
    return '{ ${this.marathi} }';
  }
}

class Quant {
  String quantity;

  Quant(this.quantity);

  factory Quant.fromJson(dynamic json) {
    return Quant(json['quantity'] as String);
  }

  @override
  String toString() {
    return '{ ${this.quantity} }';
  }
}

class Cost {
  String unitcost;

  Cost(this.unitcost);

  factory Cost.fromJson(dynamic json) {
    return Cost(json['unitcost'] as String);
  }

  @override
  String toString() {
    return '{ ${this.unitcost} }';
  }
}
