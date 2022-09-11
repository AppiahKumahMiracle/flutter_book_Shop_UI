import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybookapp/constants/color_constant.dart';
import 'package:mybookapp/models/popularbook_model.dart';

import '../widget/custom_tab_indicator.dart';

final String assetName = 'assets/icons/icon_back_arrow.svg';
final Widget svg = SvgPicture.asset(
    assetName,
    semanticsLabel: 'Acme Logo'
);


class SelectedBookScreen extends StatelessWidget {


  final PopularBookModel popularBookModel;
  SelectedBookScreen({Key? key, required this.popularBookModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popAndPushNamed(context, "/homeScreen");
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          height: 49,
          color: Colors.transparent,
          child: TextButton(
            onPressed: () {},
            child: Text('Add to Library',
            style: TextStyle(
              fontFamily: 'openSans',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: kWhiteColor,

            ),
            ),
            style: TextButton.styleFrom (
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
              backgroundColor: kMainColor
            ),
          ),

        ),
        body: SafeArea(
          child: Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: kMainColor,
                  expandedHeight: MediaQuery.of(context).size.height*0.5,
                  flexibleSpace: Container(
                    color: Color(popularBookModel.color),
                    height: MediaQuery.of(context).size.height*0.5,
                    // color: Color(popularBookModel.color),
                    child: Stack(
                      children: [
                        Positioned(
                            left: 25,
                            top: 35,
                            child: GestureDetector(
                              onTap: () {
                               Navigator.popAndPushNamed(context, "/homeScreen" );


                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: kWhiteColor
                                ),
                                child: SvgPicture.asset(assetName),
                        ),
                            ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 62),
                            width: 172,
                            height: 225,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                image: AssetImage(popularBookModel.image)
                                ),
                                borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                        )
                      ],
                    ),

                  ),
                ),
                SliverList(delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      popularBookModel.title,
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 27,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600
                      ),

                    ),


                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7, left: 25),
                    child: Text(
                      popularBookModel.author,
                      style: TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 14,
                          color: kGreyColor,
                          fontWeight: FontWeight.w400
                      ),

                    ),


                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        '\$',
                        style: TextStyle(
                            fontFamily: 'openSans',
                            fontSize: 14,
                            color: kMainColor,
                            fontWeight: FontWeight.w600
                        ),

                      ),
                        Text(
                          popularBookModel.price,
                          style: TextStyle(
                              fontFamily: 'openSans',
                              fontSize: 32,
                              color: kMainColor,
                              fontWeight: FontWeight.w600
                          ),

                        ),
                    ]
                    ),


                  ),
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(top: 23, bottom: 36),
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
                              width: 30,
                              color: kBlackColor
                          ),
                          tabs: [
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 39),
                                child: Text('Description'),
                              ) ,
                            ),
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 39),
                                child: Text('Reviews'),
                              ) ,
                            ),
                            Tab(
                              child: Container(
                                margin: EdgeInsets.only(right: 39),
                                child: Text('Similar'),
                              ) ,
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: Text(
                        popularBookModel.description,
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kGreyColor,
                        letterSpacing: 1.5,
                        height: 2,
                      ),
                    ),

                  )
                ]),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
