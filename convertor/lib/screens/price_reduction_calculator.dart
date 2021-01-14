import 'dart:ffi';

import 'package:convertor/models/price_reduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceReductionCalculator extends StatefulWidget {
  PriceReductionCalculator({Key key, this.title}) : super(key: key);

  final String title;
  
  

  @override
  _PriceReductionCalculatorState createState() =>
      _PriceReductionCalculatorState();
}




class _PriceReductionCalculatorState extends State<PriceReductionCalculator> {
  
  double prixSaisis; 
  int pourcentSaisis; 
  double economie; 
  double prixAPayer;
  bool isVisible = false;
  
  PriceReduction myPriceReduction = PriceReduction(0.0 , 0); 
  
 

  @override
 void initState(){
   super.initState();
   myPriceReduction = new PriceReduction(prixSaisis, pourcentSaisis);
 }
 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child : Text( 'Prix :'),
                  
                ),
                Container(
                  width: 300,
                  child: TextField(
                    onSubmitted: (String monPrixSaisis){
                     if( double.tryParse(monPrixSaisis) != null ){

                       setState(() {
                        prixSaisis= double.parse(monPrixSaisis);
                        }
                      );

                     }
                      
                    },
                    decoration: InputDecoration(
                      labelText: "Saisir le prix de l'article",
                      ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),    
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( 
                  child: Text( 'Réduction :'),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    onSubmitted: (String maReduction){
                      if(int.tryParse(maReduction) != null){
                        setState(() {
                          pourcentSaisis = int.parse(maReduction);
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Saisir la réduction",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(icon: Icon(Icons.check_box),
                    iconSize: 50,
                    onPressed: (){
                      List reduction = PriceReduction.calcul(prixSaisis, 
                      pourcentSaisis); 
                      setState(() {
                        isVisible = true;
                        economie = reduction.last;
                        prixAPayer = reduction.first;
                      });
                      
                    },
                  ),
                ),
              ],
            ),
            isVisible ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( 
                  child: Text('Vous économiser: $economie € il vous reste à payer $prixAPayer €'),
                ),
              ],
            ) : Container(),
            
          ],
        ),

      ),
    );
  }
}
           