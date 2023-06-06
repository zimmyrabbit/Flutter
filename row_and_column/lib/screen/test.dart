import 'package:flutter/material.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width:50.0,
                      height:50.0,
                      color:Colors.red,
                    ),
                    Container(
                      width:50.0,
                      height:50.0,
                      color:Colors.orange,
                    ),
                    Container(
                      width:50.0,
                      height:50.0,
                      color:Colors.yellow,
                    ),
                    Container(
                      width:50.0,
                      height:50.0,
                      color:Colors.green,
                    ),
                  ],
                )
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.orange,
                      ),
                    ],
                  )
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.red,
                      ),
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.orange,
                      ),
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.yellow,
                      ),
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.green,
                      ),
                    ],
                  )
              ),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:50.0,
                        height:50.0,
                        color:Colors.green,
                      ),
                    ],
                  )
              )
            ],
          )
        )
      )
    );
  }
}
