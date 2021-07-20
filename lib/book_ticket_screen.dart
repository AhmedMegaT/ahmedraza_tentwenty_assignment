import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({Key? key}) : super(key: key);

  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {

  List<String>? mLocation=['Islamabad','Lahore','Karachi','Multan'];
  List<String>? mCinema=['Cinema1','Cinema2','Cinema3','Cinema4'];
  String? mSelectedLocation;
  String? mSelectedCinema;

  @override
  void initState() {
    // TODO: implement initState
    mSelectedLocation=mLocation![0];
    mSelectedCinema=mCinema![0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: mSelectedLocation,
                    items: mLocation!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        mSelectedLocation=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Cinema',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: mSelectedCinema,
                    items: mCinema!.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        mSelectedCinema=value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Select Seats',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),

                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Container()),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.event_seat)),
                  ],
                ),

                SizedBox(height: 20,),
                Container(
                  child: RaisedButton(
                    onPressed: (){

                    },
                    child: Center(child: Text('Book Ticket')),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
