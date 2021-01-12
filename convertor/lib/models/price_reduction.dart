class PriceReduction {
  double price;
  int reduction;

  PriceReduction(double myPrice, int myReduction) {
    this.price = myPrice;
    this.reduction = myReduction;
  }

  Map<String, Object> calcul(double myPrice, int myReduction) {
    double thisReduc = (myPrice * myReduction) / 100;
    double endPrice = myPrice - thisReduc;

    return {'endPrice': endPrice, 'reduc': thisReduc};
  }
}
