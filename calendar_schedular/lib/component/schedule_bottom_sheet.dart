import 'package:calendar_schedular/component/custom_text_field.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:calendar_schedular/model/category_color.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/database/drift_database.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectdDate;
  final int? scheduleId;

  const ScheduleBottomSheet({
    required this.selectdDate,
    this.scheduleId,
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  int? selectedColorId;

  @override
  Widget build(BuildContext context) {
    //입력키보드 창이 떴을때 올라온 만큼의 높이
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        //빈공간 탭 시 키보드 닫히도록
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: FutureBuilder<Schedule>(
          future: null,
          builder: (context, snapshot) {
            return FutureBuilder<Schedule>(
                future: widget.scheduleId == null
                    ? null
                    : GetIt.I<LocalDatabase>()
                        .getScheduleById(widget.scheduleId!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('스케줄을 불러올 수 없습니다.'),
                    );
                  }
                  //FutureBuilder 처음 실행 됐고, 로딩중일 때
                  if (snapshot.connectionState != ConnectionState.none &&
                      !snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //Future가 실행 되고, 값이 있는데 단 한번도 starttime이 셋팅되지 않았을 때
                  if (snapshot.hasData && startTime == null) {
                    startTime = snapshot.data!.startTime;
                    endTime = snapshot.data!.endTime;
                    content = snapshot.data!.content;
                    selectedColorId = snapshot.data!.colorId;
                  }
                  print('snapshot.data : ${snapshot.data}');
                  return SafeArea(
                    child: Container(
                      color: Colors.white,
                      height:
                          MediaQuery.of(context).size.height / 2 + bottomInset,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: bottomInset),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 16.0),
                          child: Form(
                            // Form 의 controller 처럼 작용
                            key: formKey,
                            //입력할때 마다 validator 작용
                            //autovalidateMode: AutovalidateMode.always,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Time(
                                  onStartSaved: (String? value) {
                                    startTime = int.parse(value!);
                                  },
                                  onEndSaved: (String? value) {
                                    endTime = int.parse(value!);
                                  },
                                  startInitialValue:
                                      startTime?.toString() ?? '',
                                  endInitialValue: endTime?.toString() ?? '',
                                ),
                                SizedBox(height: 16.0),
                                _Contents(
                                  onSaved: (String? value) {
                                    content = value;
                                  },
                                  contentInitialValue: content ?? '',
                                ),
                                SizedBox(height: 16.0),
                                FutureBuilder<List<CategoryColor>>(
                                    future: GetIt.I<LocalDatabase>()
                                        .getCategoryColors(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          selectedColorId == null &&
                                          snapshot.data!.isNotEmpty) {
                                        selectedColorId == snapshot.data![0].id;
                                      }
                                      //print(snapshot.data);
                                      return _ColorPicker(
                                        colors: snapshot.hasData
                                            ? snapshot.data!
                                            : [],
                                        selectedColorId: selectedColorId,
                                        colorIdSetter: (int id) {
                                          setState(() {
                                            selectedColorId = id;
                                          });
                                        },
                                      );
                                    }),
                                SizedBox(height: 16.0),
                                _SaveButton(
                                  onPressed: onSavePressed,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }

  void onSavePressed() async {
    //formkey는 생성을 했는데 Form 위젯과 결합을 안했을 때
    if (formKey.currentState == null) {
      return;
    }
    //validate 실행 순간 Form아래에 있는
    //모든 TextFormField들의 validator가 실행된다
    // 하나라도 String값 리턴 시 에러로 판단 / 모두 null 일경우 true
    if (formKey.currentState!.validate()) {
      print('에러가 없습니다.');
      //Form 저장 시
      // onSave 모두 실행
      formKey.currentState!.save();
      print('-------------------------');
      print('StartTime : $startTime');
      print('EndTime : $endTime');
      print('Content : $content');
      if (widget.scheduleId == null) {
        final key = await GetIt.I<LocalDatabase>().createSchedule(
          SchedulesCompanion(
            date: Value(widget.selectdDate),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorId: Value(selectedColorId!),
          ),
        );
      } else {
        await GetIt.I<LocalDatabase>().updateScheduleById(
          widget.scheduleId!,
          SchedulesCompanion(
            date: Value(widget.selectdDate),
            startTime: Value(startTime!),
            endTime: Value(endTime!),
            content: Value(content!),
            colorId: Value(selectedColorId!),
          ),
        );
      }
      Navigator.of(context).pop();
    } else {
      print('에러가 있습니다.');
    }
  }
}

class _Time extends StatelessWidget {
  final FormFieldSetter<String> onStartSaved;
  final FormFieldSetter<String> onEndSaved;
  final String startInitialValue;
  final String endInitialValue;

  const _Time({
    required this.onStartSaved,
    required this.onEndSaved,
    required this.startInitialValue,
    required this.endInitialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: '시작 시간',
            isTime: true,
            onSaved: onStartSaved,
            initialValue: startInitialValue,
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: CustomTextField(
            label: '마감 시간',
            isTime: true,
            onSaved: onEndSaved,
            initialValue: endInitialValue,
          ),
        ),
      ],
    );
  }
}

class _Contents extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final String contentInitialValue;

  const _Contents({
    required this.onSaved,
    required this.contentInitialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        isTime: false,
        onSaved: onSaved,
        initialValue: contentInitialValue,
      ),
    );
  }
}

typedef ColorIdSetter = void Function(int id);

class _ColorPicker extends StatelessWidget {
  final List<CategoryColor> colors;
  final int? selectedColorId;
  final ColorIdSetter colorIdSetter;

  const _ColorPicker({
    required this.colors,
    required this.selectedColorId,
    required this.colorIdSetter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Wrap -> 줄바꿈이 자동으로 되는 Row
    return Wrap(
      // 좌우 spacing
      spacing: 8.0,
      // 상하 spacing
      runSpacing: 10.0,
      children: colors
          .map((e) => GestureDetector(
                onTap: () {
                  colorIdSetter(e.id);
                },
                child: renderColor(
                  e,
                  selectedColorId == e.id,
                ),
              ))
          .toList(),
    );
  }

  Widget renderColor(CategoryColor color, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          int.parse(
            'FF${color.hexcode}',
            radix: 16,
          ),
        ),
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 4.0,
              )
            : null,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: PRIMARY_COLOR,
            ),
            child: Text('저장'),
          ),
        ),
      ],
    );
  }
}
