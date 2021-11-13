import 'package:flutter/material.dart';
import 'package:tudotask/Modals/modalclass.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final BreakingBad breakingBad;

  DetailScreen({required this.breakingBad});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String birthday = '';

  getday() {
    if (widget.breakingBad.birthday == "Unknown") {
      setState(() {
        birthday = "Unknown";
      });
    } else {
      DateTime date =
          DateFormat('MM-dd-yyyy').parse(widget.breakingBad.birthday);

      String format = DateFormat('dd MMM ,yyyy').format(date);
      setState(() {
        birthday = format;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getday();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Detail'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        height: height,
        width: width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 200,
              color: Colors.blue,
              child: Image.network(
                widget.breakingBad.image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.breakingBad.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              birthday,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
