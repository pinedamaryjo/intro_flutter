import 'package:flutter/material.dart';
import 'package:pineda_flutter/Constants.dart';
import 'package:google_fonts/google_fonts.dart';



class Dashboard extends StatefulWidget {
  static const String routeName = 'Dashboard';
  final String email;
  const Dashboard(this.email);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                              showCursor: false,
                              decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          )),
                      
                      Icon(
                        Icons.mic,
                        color: Colors.black54.withOpacity(.6),
                      ),
                    ],
                  ),
                  

                  decoration: BoxDecoration(
                    color: Constants.searchColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30,),
            Text(
              'Welcome,' + widget.email,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}