class PaymentTransaction {
  final String transactionId;
  final String date;
  final int amount;
  final String method;
  final String status;
  final String campaignTitle;
  final String campaignImage;
  final String campaignDescription;

  PaymentTransaction({
    required this.transactionId,
    required this.date,
    required this.amount,
    required this.method,
    required this.status,
    required this.campaignTitle,
    required this.campaignImage,
    required this.campaignDescription,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      transactionId: json['transactionId'],
      date: json['date'],
      amount: json['amount'],
      method: json['method'],
      status: json['status'],
      campaignTitle: json['campaignTitle'],
      campaignImage: json['campaignImage'],
      campaignDescription: json['campaignDescription'],
    );
  }
}
