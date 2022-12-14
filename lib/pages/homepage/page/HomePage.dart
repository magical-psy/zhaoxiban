// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/homepage/model/functionButton.dart';
import 'package:zhaoxiban/pages/homepage/page/addPage.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final dlanguage = Provider.of<LanguageSetting>(context).appLanguage;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: const Text(
            "老年人",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 25.0,
                fontFamily: 'weird'),
          ),
          actions: [
            MaterialButton(
                child: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AddPage();
                    },
                  ));
                })
          ],
        ),
        body: Consumer<FunctionList>(
          builder: (context, list, child) {
            List<Widget> funcList = [];
            for (var item in list.added) {
              funcList.add(FunctionButton(item, true, 0, dlanguage));
            }
            return GridView.count(
                padding: const EdgeInsets.all(27),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                mainAxisSpacing: 28,
                crossAxisSpacing: 28,
                children: funcList);
          },
        ));
  }
}
