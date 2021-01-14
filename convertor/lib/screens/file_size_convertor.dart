import 'package:convertor/models/dropdown_item.dart';
import 'package:convertor/models/file_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileSizeConvertor extends StatefulWidget {
  FileSizeConvertor({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FileSizeConvertorState createState() => _FileSizeConvertorState();
}

class _FileSizeConvertorState extends State<FileSizeConvertor> {
  List<DropdownItem> _fileSizeUnit = [
    DropdownItem("Octet - O", "o"),
    DropdownItem("Kilooctet - Ko", "ko"),
    DropdownItem("Mégaoctet - Mo", "mo"),
    DropdownItem("Gigaoctet - Go", "go"),
    DropdownItem("Téraoctet - To", "to"),
    DropdownItem("Pétaoctet - Po", "po"),
  ];

  DropdownItem _dropdownValue;
  DropdownItem _dropdownValue2;

  FileSize fileSize1 = FileSize(0, "o");
  FileSize fileSize2 = FileSize(0, "o");

  @override
  void initState() {
    super.initState();
    _dropdownValue = _fileSizeUnit.first;
    _dropdownValue2 = _fileSizeUnit.first;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> _truc = _fileSizeUnit.map((e) {
      return DropdownMenuItem<DropdownItem>(
        child: Text(e.text),
        value: e,
      );
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.arrow_downward),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<DropdownItem>(
                          value: _dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (DropdownItem newValue) {
                            setState(() {
                              _dropdownValue = newValue;

                              fileSize1.unit = newValue.value;

                              fileSize2.size =
                                  fileSize2.convertSize(fileSize1.unit);
                            });
                          },
                          items: _truc),
                      Container(
                        width: 300,
                        child: TextFormField(
                          key: Key(fileSize1.size.toString()),
                          initialValue: fileSize1.size.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            print(value.runtimeType);
                            setState(() {
                              fileSize1.size = double.parse(value);
                              fileSize2.size =
                                  fileSize1.convertSize(fileSize2.unit);
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Value to convert'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<DropdownItem>(
                          value: _dropdownValue2,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (DropdownItem newValue) {
                            setState(() {
                              _dropdownValue2 = newValue;

                              fileSize2.unit = newValue.value;

                              fileSize1.size =
                                  fileSize1.convertSize(fileSize2.unit);
                            });
                          },
                          items: _truc),
                      Container(
                        width: 300,
                        child: TextFormField(
                          key: Key(fileSize2.size.toString()),
                          initialValue: fileSize2.size.toString(),
                          onChanged: (String value) {
                            setState(() {
                              fileSize2.size = double.parse(value);

                              fileSize1.size =
                                  fileSize2.convertSize(fileSize1.unit);
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Value to convert'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
