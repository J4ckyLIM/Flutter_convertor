class PriceReduction {

    double price; // prix de départ
    int reduction; // valeur de la réduction

    PriceReduction(double myPrice, int myReduction){
        
      this.price = myPrice;
      this.reduction = myReduction;
    }

    Map<String, Object> calcul(double myPrice, int myReduction){
      
      double thisReduc = (myPrice * myReduction)/100; // calcule de l'economie
      double endPrice= myPrice - thisReduc; 
      return {
        'endPrice': endPrice,
        'reduc': thisReduc
      }; // renvoie le  prix à payer et  la valeur de l'économie sous format Map<String, object>
    }
 
}