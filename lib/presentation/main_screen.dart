import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator_clone/presentation/bloc/calc_bloc.dart';
import 'package:ios_calculator_clone/presentation/shared_widget/buttons.dart';
import 'package:ios_calculator_clone/presentation/styles_themes/styles_themes.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController txt = TextEditingController();
  final CalcBloc blocanswer = CalcBloc();
  String res = "";
  String answer = "";

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CalcBloc>(context).add(AddCharEvent(char: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var devHeight = MediaQuery.of(context).size.height;
    var devWidth = MediaQuery.of(context).size.width;

    double Equal(String i) {
      String finaluserinput = i.replaceAll('x', '*');
      Expression exp = Parser().parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: devHeight / 3.5,
                width: devWidth,
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocBuilder<CalcBloc, CalcState>(
                        builder: (context, state) {
                          if (state is CharLoaded) {
                            return Text(
                              state.res,
                              style: TextStyle(fontSize: 30),
                            );
                          }
                          return Text("");
                        },
                      ),
                      SizedBox(height: 30),
                      BlocBuilder<CalcBloc, CalcState>(
                        bloc: blocanswer,
                        builder: (context, state) {
                          if (state is EqualState) {
                            return Text(
                              state.ans,
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 60),
                            );
                          }
                          return Text(
                            "0",
                            style: TextStyle(fontSize: 60),
                          );
                        },
                      )
                    ],
                  ),
                )),
            Expanded(
              child: BlocBuilder<CalcBloc, CalcState>(
                builder: (context, state) {
                  if (state is CharLoaded) {
                    return Container(
                      //color: Colors.red,
                      //color: Colors.red,
                      //padding: EdgeInsets.sy(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SharedWidget.circlebutton(
                                  color: Colors.grey,
                                  textColor: Colors.black,
                                  text: "C",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context)
                                        .add(AddCharEvent(char: ""));
                                    blocanswer.add(EqualEvent(ans: "0"));
                                  },
                                ),
                                SharedWidget.circlebutton(
                                    color: Colors.grey,
                                    textColor: Colors.black,
                                    text: "-",
                                    onClick: () {
                                      BlocProvider.of<CalcBloc>(context).add(
                                          AddCharEvent(char: state.res + "-"));
                                    }),
                                SharedWidget.circlebutton(
                                    color: Colors.grey,
                                    textColor: Colors.black,
                                    text: "%",
                                    onClick: () {
                                      BlocProvider.of<CalcBloc>(context)
                                          .add(AddCharEvent(
                                        char: (int.parse(state.res) / 100)
                                            .toString(),
                                      ));
                                    }),
                                SharedWidget.circlebutton(
                                    color: Colors.orange,
                                    text: "÷",
                                    onClick: () {
                                      BlocProvider.of<CalcBloc>(context).add(
                                          AddCharEvent(char: state.res + "÷"));
                                      double eval = Equal(state.res);
                                      blocanswer.add(
                                          EqualEvent(ans: eval.toString()));
                                    })
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedWidget.circlebutton(
                                  text: "7",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "7"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "8",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "8"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "9",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "9"));
                                  }),
                              SharedWidget.circlebutton(
                                  color: Colors.orange,
                                  text: "X",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "x"));
                                    double eval = Equal(state.res);
                                    blocanswer
                                        .add(EqualEvent(ans: eval.toString()));
                                  })
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedWidget.circlebutton(
                                  text: "4",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "4"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "5",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "5"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "6",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "6"));
                                  }),
                              SharedWidget.circlebutton(
                                  color: Colors.orange,
                                  text: "-",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "-"));
                                    double eval = Equal(state.res);
                                    blocanswer
                                        .add(EqualEvent(ans: eval.toString()));
                                  })
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SharedWidget.circlebutton(
                                  text: "1",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "1"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "2",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "2"));
                                  }),
                              SharedWidget.circlebutton(
                                  text: "3",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "3"));
                                  }),
                              SharedWidget.circlebutton(
                                  color: Colors.orange,
                                  text: "+",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "+"));
                                    double eval = Equal(state.res);
                                    blocanswer
                                        .add(EqualEvent(ans: eval.toString()));
                                  }),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //SharedWidget.circlebutton(text: "00", onClick: () {}),
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 150,
                                height: 70,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white38,
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "0"));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("0",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SharedWidget.circlebutton(
                                  text: ".",
                                  onClick: () {
                                    BlocProvider.of<CalcBloc>(context).add(
                                        AddCharEvent(char: state.res + "."));
                                  }),
                              SharedWidget.circlebutton(
                                  color: Colors.orange,
                                  text: "=",
                                  onClick: () {
                                    double eval = Equal(state.res);
                                    blocanswer
                                        .add(EqualEvent(ans: eval.toString()));
                                  }),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
