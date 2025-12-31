import 'package:flutter/material.dart';
import 'package:tourn/Ui/main/category/home/buttom_profile/edit_profile.dart';
import 'package:tourn/Ui/main/category/home/buttom_search.dart/search.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Nút next ở góc phải
          TextButton(
            onPressed: () {
              // Xử lý khi nhấn nút edit
              _gotoeditpage(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Icon(Icons.edit, color: Colors.black, size: 20),
          ),
          TextButton(
            onPressed: () {
              // Xử lý khi nhấn nút search
              _gotosearchpage(context);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Icon(Icons.search, color: Colors.black, size: 25),
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
        _buildcategoryNamefield(),
        _buildcategorychooseIconfield(),
        _buildcategorychooseBackgroundcolorfield(),
      ],
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

  void _gotoeditpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const edit()),
    );
  }

  void _gotosearchpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const search()),
    );
  }
}
