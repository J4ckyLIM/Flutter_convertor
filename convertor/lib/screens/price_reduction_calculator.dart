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
  
  double seizedPrice; 
  int seizedPercent; 
  double economy; 
  double lastPrice;
  bool isVisible = false;
  
  PriceReduction myPriceReduction = PriceReduction(0.0 , 0); 
  
 

  @override
 void initState(){
   super.initState();
   myPriceReduction = new PriceReduction(seizedPrice, seizedPercent);
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
                    onSubmitted: (String mySeizedPrice){
                     if( double.tryParse(mySeizedPrice) != null ){

                       setState(() {
                        seizedPrice= double.parse(mySeizedPrice);
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
                    onSubmitted: (String myReduc){
                      if(int.tryParse(myReduc) != null){
                        setState(() {
                          seizedPercent = int.parse(myReduc);
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
                      List reduction = PriceReduction.calcul(seizedPrice, 
                      seizedPercent); 
                      setState(() {
                        isVisible = true;
                        economy = reduction.last;
                        lastPrice = reduction.first;
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
                  child: Text('Vous économiser: $economy € il vous reste à payer $lastPrice €'),
                ),
              ],
            ) : Container(),
            
          ],
        ),

      ),
    );
  }
}
           