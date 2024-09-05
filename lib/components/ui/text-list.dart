// 有状态的组件
import 'package:ctmd_app/utils/tts-speed.dart';
import 'package:flutter/material.dart';

class TextList extends StatefulWidget {
  /// Constructs a [TextList]
  const TextList({Key? key}) : super(key: key);

  @override
  State<TextList> createState() => _TextListState();
}

class _TextListState extends State<TextList> {
  /// The list of items
  final List<String> items = <String>[
    '小鼻子',
    '对面的听好了',
    '你们已经被包围了',
    '赶快举起你们的大白裤衩',
    '尽情的摇摆吧',
    '小鼻子',
    '对面的听好了',
    '你们已经被包围了',
    '赶快举起你们的大白裤衩',
    '尽情的摇摆吧',
    '小鼻子',
    '对面的听好了',
    '你们已经被包围了',
    '赶快举起你们的大白裤衩',
    '尽情的摇摆吧',
    '小鼻子',
    '对面的听好了',
    '你们已经被包围了',
    '赶快举起你们的大白裤衩',
    '尽情的摇摆吧'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () {
            TtsSpeedUtils().speak(items[index]);
          },
        );
      },
    );
  }
}
