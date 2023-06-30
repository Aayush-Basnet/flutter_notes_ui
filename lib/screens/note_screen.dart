import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  late TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        height: 200,
        width: 160,
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index
              ? Color.fromARGB(255, 11, 136, 168)
              : Color(0XFFF5F7FB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(
                    color: Colors.black26, offset: Offset(0, 2), blurRadius: 10)
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                title,
                style: TextStyle(
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Color(0XFFAFB4C6),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/user.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Aayush Basnet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(
                      width: 20,
                    );
                  }
                  return _buildCategoryCard(
                    index - 1,
                    categories.keys.toList()[index - 1],
                    categories.values.toList()[index - 1],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Color.fromARGB(255, 11, 136, 168),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4.0,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Notes',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Important',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Performed',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 233, 235),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[0].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _timeFormatter.format(notes[0].date),
                      style: TextStyle(
                          color: Color(0XFFAFB4C6),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    notes[0].content,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      _dateFormatter.format(notes[0].date),
                      style: TextStyle(
                        color: Color(0XFFAFB4C6),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 7,
                      ),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 11, 136, 168),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 233, 235),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      notes[1].title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      _timeFormatter.format(notes[1].date),
                      style: TextStyle(
                          color: Color(0XFFAFB4C6),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    notes[1].content,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
