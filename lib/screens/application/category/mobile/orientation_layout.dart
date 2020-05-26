import 'package:flutter/material.dart';
import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/utils/constants.dart';
import 'package:flutter_bonapp/utils/env.dart';
import 'package:flutter_bonapp/viewmodels/category/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CategoryMobilePortrait extends BaseModelWidget<CategoryViewModel> {
  final Menu category;

  CategoryMobilePortrait({this.category});
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35.0,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(
                    height: 200.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.dstATop,
                      ),
                      image: NetworkImage(graphQLApiImg + category.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 120.0,
                  left: 10.0,
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 155.0,
                  left: 10.0,
                  child: Container(
                    width: width * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          category.description,
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            ColumnHeader(
              title: 'Scroll down for more.',
              more: false,
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  for (var i = 0; i < category.items.length; i++) _buildListItem(category.items[i], 4.0, width),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryMobileLandscape extends BaseModelWidget<CategoryViewModel> {
  final Menu category;

  CategoryMobileLandscape({this.category});
  @override
  Widget build(BuildContext context, CategoryViewModel data) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back),
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35.0,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => print('Alert Bar'),
                  icon: Icon(Icons.shopping_cart),
                )
              ],
            ),
            Stack(children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(
                  height: 200.0,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.dstATop,
                    ),
                    image: NetworkImage(graphQLApiImg + category.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 125.0,
                left: 10.0,
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 165.0,
                left: 10.0,
                child: Text(
                  category.description,
                  style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class ColumnHeader extends StatelessWidget {
  final String title;
  final bool more;

  ColumnHeader({
    Key key,
    this.title,
    this.more = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: primaryFont,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (more)
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'See more',
                    style: TextStyle(
                      fontFamily: secondaryFont,
                      fontSize: 10.0,
                      color: Color(primaryColour),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10.0,
                    color: Color(primaryColour),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

_buildListItem(Items item, double rating, double width) {
  return Padding(
    padding: EdgeInsets.all(15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            width: width,
            child: Row(
              children: [
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(secondaryColour),
                  ),
                  child: Center(
                    child: Image.network(graphQLApiImg + item.image, height: 70.0, width: 70.0),
                  ),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    item.subtitle != null ? Text(item.subtitle) : Text(''),
                    SizedBox(
                      height: 2.5,
                    ),
                    SmoothStarRating(
                      allowHalfRating: false,
                      starCount: rating.toInt(),
                      rating: rating,
                      color: Color(0xFFFFD143),
                      borderColor: Color(0xFFFFD143),
                      size: 15.0,
                      spacing: 0.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '£${item.price.toStringAsFixed(2)}',
                          style: TextStyle(fontFamily: 'Raleway'),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Container(
                child: InkResponse(
                  onTap: () {},
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(primaryColour),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.info,
                      color: Color(whiteColour),
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: InkResponse(
                  onTap: () {},
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(secondaryColour),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Color(whiteColour),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
