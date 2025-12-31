import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tourn/Ui/main/category/home/buttom_add/next_page.dart';

class createandeditcontent extends StatelessWidget {
  const createandeditcontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Create_content_page".tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          // Nút next ở góc phải
          TextButton(
            onPressed: () {
              // Xử lý khi nhấn nút next
              _gotonextpage(context);
            },
            child: Text(
              "Next".tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: _buildbodypagescreen(),
    );
  }

  Widget _buildbodypagescreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment
          .start, // Căn chỉnh theo trục chính từ trên xuống dưới
      crossAxisAlignment: CrossAxisAlignment
          .start, // Căn chỉnh theo trục ngang từ trái sang phải
      children: [
        _buildcategoryoption(),
        _buildcategoryNamefield(),
        _buildcategorychooseIconfield(),
        _buildcategorychooseBackgroundcolorfield(),
      ],
    );
  }

  Widget _buildcategoryoption() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        "a",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildcategoryNamefield() {
    return Container();
  }

  Widget _buildcategorychooseIconfield() {
    return Container();
  }

  Widget _buildcategorychooseBackgroundcolorfield() {
    return Container();
  }

  void _gotonextpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const next()),
    );
  }
}
