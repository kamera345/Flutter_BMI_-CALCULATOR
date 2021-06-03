import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_input.dart';
import 'constants.dart';
import 'Calculate.dart';
import 'Results.dart';

class BMICal extends StatefulWidget {
  @override
  _BMICalState createState() => _BMICalState();
}

class _BMICalState extends State<BMICal> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                    },
                    child: Reusable(color: selectedGender == Gender.male ? activeColor: inactiveColor,
                      cardChild:IconContent(icon:  FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                ),
                Expanded(

                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Reusable(color: selectedGender == Gender.female ? activeColor: inactiveColor,
                      cardChild:IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Reusable(
            color: inactiveColor,
            cardChild: GestureDetector(
              onTap: (){

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT', textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius:25.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        label: height.toDouble().round().toString(),
                        inactiveColor: activeColor,
                        onChanged: (double value){
                          setState(() {
                            height = value.round();
                          });

                    }),
                  )
                ],
              ),
            ),
          ),
          ),
          Expanded(child: Row(
            children: <Widget> [
              Expanded(
                child:Reusable(color: inactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT'),
                      SizedBox(height: 5.0),
                      Text(weight.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },),
                          SizedBox(width: 10.0),
                          RoundButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child:Reusable(color:inactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE'),
                      SizedBox(height: 5.0),
                      Text(age.toString(),
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                          SizedBox(width: 10.0),
                          RoundButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          GestureDetector(
            onTap: (){
              ResultOut result =  ResultOut(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator(
                cal: result.Cal(), getResult: result.GetResult(), interpretation: result.Interpretation(),
              ),),);
            },
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),),
                ),
              ),
              width: double.infinity,
              color: Colors.red,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}


class RoundButton extends StatelessWidget {

  RoundButton({@required this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 36.0),
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}
