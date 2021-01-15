class PriceReduction {
  double price;
  int reduction;

  PriceReduction(double myPrice, int myReduction) {
    this.price = myPrice;
    this.reduction = myReduction;
  }

  static List calcul(double myPrice, int myReduction) {
    double thisReduc = (myPrice * myReduction) / 100;
    double endPrice = myPrice - thisReduc;
    return [endPrice, thisReduc];
  }
}
