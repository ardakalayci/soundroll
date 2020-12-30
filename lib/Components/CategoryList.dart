import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundoji/Models/SoundojiObj.dart';

class CategoryList extends StatefulWidget {
  final String title;
  final List<SoundojiObj> list;
  final Function playSound;

  const CategoryList({Key key, this.title, this.list, this.playSound})
      : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
List colorList=[
Colors.tealAccent,
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.pinkAccent,
];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 36,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[700],
                    ),
                  ),
                  /*GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View All',
                      style: TextStyle(
                          color: _colors.defaultWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),*/
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            LimitedBox(
              maxHeight: 90,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            widget.playSound(index, widget.title);
                          },
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Card(

margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: colorList[Random().nextInt(colorList.length)],width: 3),
                              borderRadius: const BorderRadius.only(
                               topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                              ),
                            ),
                            elevation: 7,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(
                                  widget.list[index].iconPath,
                                  width:
                                      MediaQuery.of(context).size.width * .14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
