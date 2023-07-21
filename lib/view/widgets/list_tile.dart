import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:hbm/style/app_colors.dart';

import 'custom_button.dart';


class EventListTile extends StatefulWidget {


  final String? id;
  final String? index;
  final String? title;
  final String? date;
  final String? endDate;
  final String? quantity;
  final String? item;
  final String? bestBid;
  final String? rank;
  final String? finalBid;
  final String? lastBid;
  final String? requisitionNo;
  final String? requisitionId;
  final String? pricePerUnit;
  final String? eventStatus;

  final String? imageUrl;
  final VoidCallback onEdit;
  final VoidCallback imageClick;
  final VoidCallback onDecline;
  final VoidCallback onSubmit;

  EventListTile(
      {required this.id,
        this.index,
        required this.title,
        required this.date,
        required this.endDate,
        required this.quantity,
        this.item,
        this.bestBid,
        this.rank,
        this.finalBid,
        this.lastBid,
        this.requisitionNo,
        this.requisitionId,
        this.pricePerUnit,
        this.eventStatus,

        this.imageUrl,
        required this.onEdit,
        required this.imageClick,
        required this.onDecline,
        required this.onSubmit
      });

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile>  with SingleTickerProviderStateMixin {
  DateTime? dateTime;


  @override
  void initState() {

    dateTime = DateTime.parse(widget.endDate.toString());


    super.initState();
  }

  @override
  dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
            decoration:  BoxDecoration(

            ),
            child: Column(
              children: [
                InkWell(
                  onTap: ()=> widget.onEdit(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,
                        top: 20,right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Expanded(
                              flex: 1,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    widget.title==null?'':widget.title!,
                                    maxLines: 2, style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.appColor
                                  ),),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text('Quantity:  ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87
                                        ),),
                                      Text(widget.quantity==null?'':widget.quantity!, style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Item:  ', style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87
                                      ),),
                                      Text(
                                        widget.item==null?'':widget.item!, style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),)
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/images/icon-1.png",
                                            ),
                                            color: Colors.black87,
                                            width: 30,
                                            height: 30,),
                                          SizedBox(width: 8,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Best Bid',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .black87
                                                ),),
                                              Row(
                                                children: [
                                                  Text('tk ',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors
                                                            .black
                                                    ),),
                                                  Text(widget.bestBid==null?'':widget.bestBid!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 14,
                                                        color: Colors
                                                            .black
                                                    ),),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],

                                      )),
                                      SizedBox(width: 5),
                                      Expanded(child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/images/icon-2.png",
                                            ),
                                            color: Colors.black87,
                                            width: 30,
                                            height: 30,),
                                          SizedBox(width: 8,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Show Rank',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .black87
                                                ),),
                                              Row(
                                                children: [
                                                  Text(widget.rank==null?'':widget.rank!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 14,
                                                        color: Colors
                                                            .black
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],

                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/images/icon-3.png",
                                            ),
                                            color: Colors.black87,
                                            width: 30,
                                            height: 30,),
                                          SizedBox(width: 8,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Final Bid',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .black87
                                                ),),
                                              Row(
                                                children: [
                                                  Text('tk ',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors
                                                            .black
                                                    ),),
                                                  Text(widget.finalBid==null?'':widget.finalBid!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 14,
                                                        color: Colors
                                                            .black
                                                    ),),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],

                                      )),
                                      SizedBox(width: 8),
                                      Expanded(child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/images/icon-4.png",
                                            ),
                                            color: Colors.black87,
                                            width: 30,
                                            height: 30,),
                                          SizedBox(width: 8,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text('Last Bid',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors
                                                        .black87
                                                ),),
                                              Row(
                                                children: [
                                                  Text(widget.lastBid==null?'':widget.lastBid!,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 14,
                                                        color: Colors
                                                            .black
                                                    ),),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],

                                      )),
                                    ],
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                      ],
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    // Replace with your desired background color
                    borderRadius: BorderRadius.circular(
                        0), // Adjust the radius as needed
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:widget.eventStatus =='Published'? Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center,
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [
                              const Text(
                                'Bidding ends in', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.appColor
                              ),),
                              const SizedBox(height: 5,),



                            ],
                          ):Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center,
                            crossAxisAlignment: CrossAxisAlignment
                                .start,
                            children: [
                              const Text(
                                'Bidding end', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.appColor
                              ),),


                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:widget.eventStatus !='Published'? Text('Event closed',style: TextStyle(
                                fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold
                            ),
                            ): RoundedCustomButton(
                              text: 'Submit',
                              onPressed: () {
                                widget.onSubmit();
                              },
                              height: 40,),
                          ))
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}