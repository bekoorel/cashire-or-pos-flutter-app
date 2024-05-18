import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modul.dart';

class widgthis extends StatefulWidget {
  const widgthis({super.key});

  @override
  State<widgthis> createState() => _widgthisState();
}

class _widgthisState extends State<widgthis> {
  //.........................

  Future<List<showhis>> gethis() async {
    http.Response futurepost =
        await http.post(Uri.parse("http://localhost:5050//gethis.php"));
    if (futurepost.statusCode == 200) {
      List datapos = jsonDecode(futurepost.body);
      List<showhis> allusrpos = [];
      for (var u in datapos) {
        showhis usarsroll = showhis.fromJson(u);
        allusrpos.add(usarsroll);
      }

      return allusrpos;
    } else {
      return throw Exception('انقطع الاتصال');
    }
  }

  //.........................
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: double.infinity,
              color: Color.fromARGB(255, 211, 53, 92),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      'الاجمالي\n00000',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) => DatePickerDialog(
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.utc(2050))));
                        },
                        child: Text(
                          " من ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        )),
                  ),
                  Container(
                    width: 200.0,
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) => DatePickerDialog(
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.utc(2050))));
                        },
                        child: Text(
                          " الي ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: FutureBuilder<List<showhis>>(
                future: gethis(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: double.infinity,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.all(2),
                              color: Colors.cyan,
                              child: Column(
                                children: [
                                  Text("${snapshot.data![index].numinvocehis}"),
                                  Text("${snapshot.data![index].invojson}"),
                                  Text("${snapshot.data![index].total}")
                                ],
                              ),
                            );
                          })),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                })),
          )
        ],
      ),
      IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
    ]));
  }
}
