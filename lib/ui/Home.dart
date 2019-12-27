import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return HomeState();
  }

}
class HomeState extends State<Home>{

  final TextEditingController _ageController=new TextEditingController();
  final TextEditingController _weightController=new TextEditingController();
  final TextEditingController _heightConroler=new TextEditingController();
  double inches=0.0;
  double result=0.0;
  String _resultreding="";
  String _finalaresult="";

  void _calclulateBMI(){
    setState(() {
      int age=int.parse(_ageController.text);
      double height=double.parse(_heightConroler.text);
      inches=height*12;
      double weight=double.parse(_weightController.text);
      if((_ageController.text.isEmpty || age>0)&&((_heightConroler.text.isEmpty||inches>0)&&(_weightController.text.isEmpty||weight>0)))
      {
        result=weight/(inches*inches)*703;

        if(double.parse(result.toStringAsFixed(1))<18.5){
          _resultreding="අඩු බර";

        }else if(double.parse(result.toStringAsFixed(1))>=18.5&&result<25){
          _resultreding="සාමාන්‍ය බර";

        }else if(double.parse(result.toStringAsFixed(1))>=25.0&&result<30){
          _resultreding="අධික බර";

        }else if(double.parse(result.toStringAsFixed(1))>=30.0){
          _resultreding="තරබාරුකම";
        }


      }else{
        result=0.0;
      }

    });

   _finalaresult="BMI IS: ${result.toStringAsFixed(1)}";
    
      }
    
      @override
      Widget build(BuildContext context) {
        
        return new Scaffold(
          appBar: AppBar(
            title: new Text('BMI'),
            centerTitle: true,
            backgroundColor:Colors.pinkAccent,
          ),
          body: new Container(
            alignment: Alignment.topCenter,
            child: new ListView(
              padding: const EdgeInsets.all(2.0),
              children: <Widget>[
                new Image.asset('images/bmilogo.png',width: 75.0,height: 85.0,),
                //text filldset ake dana kotuwe
                new Container(
                  margin: const EdgeInsets.all(3.0),
                  width: 350.0,
                  height: 245.0,
                  color: Colors.grey.shade300,
    
                  //text fild dana ake
                  child: new Column(
                    children: <Widget>[
                      new TextField(
                        controller: _ageController,keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Age',
                          hintText: 'e.g:24',
                          icon: new Icon(Icons.person_outline),
                        ),
    
                      ),
                      new TextField(
                        controller: _heightConroler,keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Height',
                          hintText: 'e.g: 6.5',
                          icon: new Icon(Icons.insert_chart),
                        ),
    
                      ),
                      new TextField(
                        controller: _weightController,keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Weight',
                          hintText: 'e.g: 180',
                          icon: new Icon(Icons.line_weight),
                        ),
    
                      ),
    
                      
    
                      new Container(
                        alignment: Alignment.topCenter,
                        child: new RaisedButton(
                          onPressed: (){
                            _calclulateBMI();
                          },
                          color: Colors.pinkAccent,
                          child: new Text('Calculate'),
                          textColor: Colors.white,
                        ),
                      ),
    
    
    
    
                    ],
                  ),
    
                ),
    
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("$_finalaresult",style: new TextStyle(fontWeight:FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.blueAccent,fontSize: 19.9),),
    
                    new Padding(padding: const EdgeInsets.all(5.0),),
                  
                    new Text("OverWeigtht:$_resultreding",style: new TextStyle(fontWeight:FontWeight.w500,fontStyle: FontStyle.italic,color: Colors.pinkAccent,fontSize: 19.9),),
    
                  ],
                 
                )
    
              ],
            ),
          ),
        );
      }
    
    }
    
    class _finalaresult {

}