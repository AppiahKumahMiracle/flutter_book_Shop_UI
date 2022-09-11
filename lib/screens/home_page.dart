import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybookapp/constants/color_constant.dart';
import 'package:mybookapp/models/newbook_model.dart';
import 'package:mybookapp/models/popularbook_model.dart';
import 'package:mybookapp/screens/select_book_screen.dart';

import '../widget/custom_tab_indicator.dart';

final String assetName = 'assets/svg/background_search.svg';
final Widget svg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Acme Logo'
);
final String assetName1 = 'assets/icons/icon_search_white.svg';
final Widget svg1 = SvgPicture.asset(
    assetName1,
    semanticsLabel: 'Acme Logo'
);
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Hello, Miracle',
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kGreyColor),
                  ),
                  Text(
                      'Discover New Books',
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor),
                  ),
                ],
              ),

              ),
              Container(
                height: 39,
                margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor
                ),
                child: Stack(
                  children:  [
                    TextField(
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 12,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search book...',
                        hintStyle: TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor
                        )

                      ),

                    ),
                    Positioned(
                      right: 0,
                        child: SvgPicture.asset(assetName),
                    ),
                    Positioned(
                      top: 8,
                      right: 9,
                      child: SvgPicture.asset(assetName1),
                    ),
                  ],
                ),
              ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kGreyColor,
                    labelStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'openSans',
                      fontWeight: FontWeight.w700
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    indicator: RoundedRectangleTabIndicator(
                      weight: 2,
                      width: 10,
                      color: kMainColor1
                    ),
                    tabs: [
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(right: 23),
                      child: Text('New'),
                    ) ,
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(right: 23),
                      child: Text('Trending'),
                    ) ,
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.only(right: 23),
                      child: Text('Best Seller'),
                    ) ,
                  ),
                ]),
              ),
            ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 25, right: 6 ),
                    itemCount: newbooks.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(right: 19),
                    height: 210,
                    width: 153,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor,
                      image: DecorationImage(image: AssetImage(newbooks[index].image),
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular',
                      style: TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap:true,
                itemCount: populars.length,
                  itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> SelectedBookScreen(
                          popularBookModel: populars[index]),
                    ));
                  },
                  child: Container(
                   margin: EdgeInsets.only(bottom: 19),
                   height: 78,
                   width: MediaQuery.of(context).size.width - 50,
                    color: kBackgroundColor,
                    child: Row(
                      children: [
                        Container(
                          height: 79,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: AssetImage(populars[index].image),
                            ),
                            color: kMainColor
                          ),
                        ),
                        SizedBox(width: 23,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(populars[index].title,
                              style: TextStyle(
                                fontFamily: 'openSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(populars[index].author,
                              style: TextStyle(
                                fontFamily: 'openSans',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: kGreyColor
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('\$' + populars[index].price,
                              style: TextStyle(
                                fontFamily: 'openSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kBlackColor
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
