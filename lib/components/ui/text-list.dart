// 有状态的组件
import 'dart:async';
import 'package:ctmd_app/cores/sql.dart';
import 'package:ctmd_app/utils/tts-speed.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TextList extends StatefulWidget {
  /// Constructs a [TextList]
  const TextList({Key? key}) : super(key: key);

  // 初始化数据库

  static Future<void> initDB() async {
    await SQLiteUtil.initDB(
      'text_list.db',
      'CREATE TABLE text_list (id INTEGER PRIMARY KEY, text TEXT)',
    );
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
    // setState(() {
    //   items = list.map((item) => item['text'] as String).toList();
    // });
    // 渲染数据,
    setState(() {
      items = list.map((item) => item['text'] as String).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 如果数据为空展示暂无数据
    if (items.isEmpty) {
      // 展示一张图片,和一段文字 暂无数据
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // https://pic.20988.xyz/2024-08-02/1722562576-715384-ch-8.jpg
            Image(
              image: NetworkImage(
                  'https://pic.20988.xyz/2024-08-02/1722562576-715384-ch-8.jpg'),
              width: 300,
            ),
            Text('暂无数据'),
          ],
        ),
      );
    }

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
