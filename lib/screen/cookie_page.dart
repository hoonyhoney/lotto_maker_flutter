import 'package:flutter/material.dart';

class CookiePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width -30.0,
            height: MediaQuery.of(context).size.width -50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildCard('Cookie mint', '\$3.99','assets/cookiemint.jpg', false, false, context),
                _buildCard('Cookie mint1', '\$5.99','assets/cookiemint.jpg', false, false, context),
                _buildCard('Cookie mint2', '\$6.99','assets/cookiemint.jpg', false, false, context),
                _buildCard('Cookie mint3', '\$7.99','assets/cookiemint.jpg', false, false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildCard(String name, String price, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
            color: Colors.white
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite ? Icon(Icons.favorite, color: Color(0xFFEF7532),) :
                        Icon(Icons.favorite_border, color: Color(0xFFEF7532),),
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                        fit: BoxFit.contain
                    )
                  ),
                ),
              ),
              SizedBox(height: 7.0,),
              Text(price,
                style: TextStyle(
                  color: Color(0xFFCC8053),
                  fontFamily: 'Varela',
                  fontSize: 14.0
                ),),
              Text(name,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0
                ),),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!added)...[
                      Icon(Icons.shopping_basket,color: Color(0xFFD17E50),size: 12.0,),
                      Text('Add to Cart', style: TextStyle(fontFamily: 'Varela',color: Color(0xFFD17E50),fontSize: 12.0),)
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
