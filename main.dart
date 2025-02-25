import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold( //Scaffold widget is being used here

          appBar: AppBar( //stays fixed on top
            title: Text("Travel Delight"),
            backgroundColor: Colors.purpleAccent,
            actions: [  //to get a clickable profile button
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                },
              ),
            ],
          ),

          body: SingleChildScrollView(//to allow scrolling otherwise it produces error
            child: Column( //Column widget used here
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                 padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                Text("HI! User", style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
                Text("Let's explore INDIA", style: TextStyle(fontSize: 25, color: Colors.blueAccent),),
                ],
                ),
                ),
                SizedBox(height: 10,),

                // Recommendations
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "RECOMMENDATIONS",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),
                SizedBox(height: 10),

                //Horizontal Scroll given here
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildDestinationCard("assets/images/agra.jpg","AGRA"),
                      _buildDestinationCard("assets/images/hyderabad.jpg","HYDERABAD"),
                      _buildDestinationCard("assets/images/jaipur.jpg","JAIPUR"),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Travel Packages (using Vertical List)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Popular Packages",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                _buildPlaceItem('assets/images/agra.jpg', 'Taj Mahal', 'RS 3500'),
                _buildPlaceItem('assets/images/hyderabad.jpg', 'Char Minar', 'RS 4600'),
                _buildPlaceItem('assets/images/jaipur.jpg', 'Hawa Mahal', 'RS 2400'),
              ],
            ),
          ),
        )
    );
  }

  Widget _buildDestinationCard(String imagePath, String destinationName) { //defining the widget 
    return Container(
      margin: EdgeInsets.only(right: 16.0, left: 16.0,),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient( //used color gradient here
            colors: [Colors.black, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          destinationName,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildPlaceItem(String imagePath, String placeName, String price) { //defining the widget
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                placeName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(price, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
