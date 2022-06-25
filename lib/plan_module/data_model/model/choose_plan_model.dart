class ChoosePlanModel {
  int? months;

  int? price;

  int? installment;

  bool? isSelected;

  ChoosePlanModel(
      {required this.months,
      required this.price,
      required this.installment,
      required this.isSelected});

  ChoosePlanModel.fromJson(Map<String, dynamic> json) {
    months = json["months"];
    price = json["price"];
    installment = json["installment"];
    isSelected = json["isSelected"];
  }
}
