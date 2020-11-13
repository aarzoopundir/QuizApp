import 'package:flutter/material.dart';
class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore,this.resetHandler);
  String get resultPhrase{
    String resultText;
    if(resultScore==30){
      resultText='Awesome!..you have a great knowledge about countries:)';
    }
    else if(resultScore==20){
      resultText='You can do better!';
    }
    else{
      resultText='Bad...Try hard next time:(';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo
            ),
          ),
          FlatButton(
            child: Text('Restart Quiz',
            style: TextStyle(
              fontSize: 25.0,
            )),

            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
