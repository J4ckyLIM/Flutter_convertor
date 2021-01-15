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
                  child : Text( 'Price :'),
                  
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
                      labelText: "Enter the price:",
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
                  child: Text( 'Reduction :'),
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
                      labelText: "Enter the reduction (%)",
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
                  child: Text('You  save: $economy €, you have to pay: $lastPrice €'),
                ),
              ],
            ) : Container(),
            
          ],
        ),

      ),
    );
  }
}
           