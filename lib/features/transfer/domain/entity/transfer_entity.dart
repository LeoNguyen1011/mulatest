class TransferEntity {
  final String fromName;
  final String fromAccount;
  final String toName;
  final String toAccount;
  final String fromAvatar;
  final String toAvatar;
  final String promptPayCitizenId;
  final num ammount;
  final String note;

  final String bankAccountName;
  final String bankName;
  final String bankAccountNo;

  final num fee;
  TransferEntity({
    required this.fromName,
    required this.fromAccount,
    required this.toName,
    required this.toAccount,
    required this.fromAvatar,
    required this.toAvatar,
    required this.promptPayCitizenId,
    required this.ammount,
    required this.note,
    required this.bankAccountName,
    required this.bankName,
    required this.bankAccountNo,
    required this.fee,
  });

  TransferEntity copyWith({
    String? fromName,
    String? fromAccount,
    String? toName,
    String? toAccount,
    String? fromAvatar,
    String? toAvatar,
    String? promptPayCitizenId,
    num? ammount,
    String? note,
    String? bankAccountName,
    String? bankName,
    String? bankAccountNo,
    num? fee,
  }) {
    return TransferEntity(
      fromName: fromName ?? this.fromName,
      fromAccount: fromAccount ?? this.fromAccount,
      toName: toName ?? this.toName,
      toAccount: toAccount ?? this.toAccount,
      fromAvatar: fromAvatar ?? this.fromAvatar,
      toAvatar: toAvatar ?? this.toAvatar,
      promptPayCitizenId: promptPayCitizenId ?? this.promptPayCitizenId,
      ammount: ammount ?? this.ammount,
      note: note ?? this.note,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankName: bankName ?? this.bankName,
      bankAccountNo: bankAccountNo ?? this.bankAccountNo,
      fee: fee ?? this.fee,
    );
  }
}
