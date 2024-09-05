// 有状态的组件
import 'dart:async';
import 'package:ctmd_app/cores/sql.dart';
import 'package:ctmd_app/utils/tts-speed.dart';
import 'package:flutter/material.dart';

class TextList extends StatefulWidget {
  /// Constructs a [TextList]
  const TextList({Key? key}) : super(key: key);

  // 初始化数据库

  static Future<void> initDB() async {
    await SQLiteUtil.initDB(
      'text_list.db',
      'CREATE TABLE text_list (id INTEGER PRIMARY KEY, text TEXT)',
    );
    // 插入数据
    await SQLiteUtil.insert('text_list', {'text': 'Hello, World!'});
    // 打印查询数据库数据
    final List<Map<String, dynamic>> list = await SQLiteUtil.query('text_list');
    list.forEach((element) {
      print(element);
    });
  }

  @override
  State<TextList> createState() => _TextListState();

  // 调用初始化数据库
  static Future<void> init() async {
    await initDB();
  }
}

class _TextListState extends State<TextList> {
  /// 保存从数据库查询到的数据
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // 初始化时加载数据库数据
  }

  // 加载数据
  Future<void> _loadData() async {
    await TextList.initDB();
    // 查询数据库数据
    final List<Map<String, dynamic>> list = await SQLiteUtil.query('text_list');
    setState(() {
      items = list.map((item) => item['text'] as String).toList();
    });
  }

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
