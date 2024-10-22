import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return const MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController questionController = TextEditingController(text: "");
  TextEditingController resultController = TextEditingController(text: "");
  Parser p = Parser();
  ContextModel cm = ContextModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 60.w, left: 15.w, right: 15.w),
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.none,
                      controller: resultController,
                      readOnly: true,
                      showCursor: false,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 60.sp,
                      ),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: TextField(
                        keyboardType: TextInputType.none,
                        controller: questionController,
                        readOnly: true,
                        showCursor: false,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 40.sp,
                        ),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:  EdgeInsets.only(top:30.w),
                        child: IconButton(onPressed: (){
                          if(questionController.text.isNotEmpty){
                            String question=questionController.text;
                            int lengthOfQuestion=question.length;
                            question = question.substring(0, lengthOfQuestion - 1);
                            questionController.text=question;
                          }
                        }, icon: Icon(Icons.backspace_outlined,size: 30.sp,)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.w),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide.none,
                        bottom: BorderSide.none,
                        left: BorderSide.none,
                        top: BorderSide(color: Colors.black45))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}7";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(211, 209, 209, 1.0),
                                    shape: BoxShape.circle,
                                  ),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "7",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}8";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}9";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "9",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  if(questionController.text.isNotEmpty){
                                    String question=questionController.text;
                                    int lengthOfQuestion=question.length;
                                    if(question[lengthOfQuestion-1] != '/' && question[lengthOfQuestion-1] != 'x' && question[lengthOfQuestion-1] != '-' && question[lengthOfQuestion-1] != '+'  ){
                                      questionController.text="${questionController.text}/" ;
                                    }else{
                                      question = '${question.substring(0, lengthOfQuestion - 1)}/';
                                      questionController.text=question;
                                    }
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "/",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}4";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "4",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}5";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "5",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}6";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "6",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  if(questionController.text.isNotEmpty){
                                    String question=questionController.text;
                                    int lengthOfQuestion=question.length;
                                    if(question[lengthOfQuestion-1] != '/' && question[lengthOfQuestion-1] != 'x' && question[lengthOfQuestion-1] != '-' && question[lengthOfQuestion-1] != '+'  ){
                                      questionController.text="${questionController.text}x" ;
                                    }else{
                                      question = '${question.substring(0, lengthOfQuestion - 1)}x';
                                      questionController.text=question;
                                    }
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "x",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}1";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}2";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text =
                                  "${questionController.text}3";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "3",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  if(questionController.text.isNotEmpty){
                                    String question=questionController.text;
                                    int lengthOfQuestion=question.length;
                                    if(question[lengthOfQuestion-1] != '/' && question[lengthOfQuestion-1] != 'x' && question[lengthOfQuestion-1] != '-' && question[lengthOfQuestion-1] != '+'  ){
                                      questionController.text="${questionController.text}-" ;
                                    }else{
                                      question = '${question.substring(0, lengthOfQuestion - 1)}-';
                                      questionController.text=question;
                                    }
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 60.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  resultController.text = "0";
                                  questionController.text="";
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "C",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  questionController.text="${questionController.text}0" ;
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  if((questionController.text).isNotEmpty){
                                    try{
                                      Expression exp = p.parse(questionController.text);
                                      if ((exp.evaluate(EvaluationType.REAL, cm)).toString() == "Infinity"){
                                        resultController.text= "Error";
                                      }else{
                                        double result = exp.evaluate(EvaluationType.REAL, cm);

                                        if (result == result.toInt()) {
                                          resultController.text = result.toInt().toString();
                                        } else {
                                          resultController.text = result.toString();
                                        }

                                      }
                                    }catch(e){
                                      resultController.text= "Error";
                                      return;
                                    }
                                  }else{
                                    resultController.text="0";
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),

                                  child: Center(
                                      child: Text(
                                    "=",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.only(left: 5.w, right: 5.w),
                              child: GestureDetector(
                                onTap: () {
                                  if(questionController.text.isNotEmpty){
                                    String question=questionController.text;
                                    int lengthOfQuestion=question.length;
                                    if(question[lengthOfQuestion-1] != '/' && question[lengthOfQuestion-1] != 'x' && question[lengthOfQuestion-1] != '-' && question[lengthOfQuestion-1] != '+'  ){
                                      questionController.text="${questionController.text}+" ;
                                    }else{
                                      question = '${question.substring(0, lengthOfQuestion - 1)}+';
                                      questionController.text=question;
                                    }
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(211, 209, 209, 1.0),
                                      shape: BoxShape.circle),
                                  //borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
