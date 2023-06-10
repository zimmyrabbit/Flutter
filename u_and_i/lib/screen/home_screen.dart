import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _TopPart(),
                _BottomPart(),
              ],
            )),
      ),
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart({super.key});

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'parisienne',
              fontSize: 80.0,
            ),
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 30.0,
                ),
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sunflower',
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed: () {
              //dialog
              showCupertinoDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      height: 300.0,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate,
                        maximumDate: DateTime(
                          now.year,
                          now.month,
                          now.day,
                        ),
                        onDateTimeChanged: (DateTime date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'asset/img/middle_image.png',
      ),
    );
  }
}
