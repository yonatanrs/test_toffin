class Order {
  String receiverName;
  String address;
  String phoneNumber;
  String note;
  bool chosen;

  Order({
    required this.receiverName,
    required this.address,
    required this.phoneNumber,
    required this.note,
    required this.chosen
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          receiverName == other.receiverName &&
          address == other.address &&
          phoneNumber == other.phoneNumber &&
          note == other.note &&
          chosen == other.chosen;

  @override
  int get hashCode =>
      receiverName.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode ^
      note.hashCode ^
      chosen.hashCode;
}