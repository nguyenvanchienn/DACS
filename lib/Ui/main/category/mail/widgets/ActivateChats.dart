// ignore: unused_import
import 'package:flutter/material.dart';
import 'detail.dart';

class ActivateChats extends StatelessWidget {
  const ActivateChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 25, left: 5),
      child: InkWell(
        onTap: () {
          _gotodetail(context);
          // Xử lý sự kiện khi nhấn vào đây
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < 100; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset("asset/images/employee-5.png"),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _gotodetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detailpage()),
    );
  }
}
