import 'package:flutter/material.dart';
import 'package:hbm/style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child:  Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircularProgressIndicator(),
              Image.asset('assets/images/loading.gif', height: 50, width: 50,),
              const SizedBox(height: 10,),
              const Text('Loading...',style: TextStyle(
                color: AppColors.appColor
              ),)
            ],
          ),
        ),
      ),
    );
  }
}