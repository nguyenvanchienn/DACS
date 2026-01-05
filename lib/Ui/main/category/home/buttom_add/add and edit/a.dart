import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tourn/Ui/main/category/home/buttom_add/add%20and%20edit/next_page.dart';

class createandeditcontentt extends StatefulWidget {
  const createandeditcontentt({super.key});

  @override
  State<createandeditcontentt> createState() => _createandeditcontenttState();
}

class _createandeditcontenttState extends State<createandeditcontentt> {
  final TextEditingController _contentcontroller =
      TextEditingController(); // Controller để quản lý nội dung nhập liệu và lưu trữ giá trị

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Đặt nền trong suốt
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
    return SingleChildScrollView(
      child: Column(
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
      ),
    );
  }

  Widget _buildcategoryoption() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Text(
        "Basic_info".tr(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildcategoryNamefield() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _contentcontroller, // Gán controller cho TextFormField
            keyboardType: TextInputType.multiline,
            minLines: 12, // Số dòng tối thiểu
            maxLines: 12, // Số dòng tối đa
            textAlignVertical:
                TextAlignVertical.top, // Căn chỉnh văn bản ở trên cùng
            decoration: InputDecoration(
              hintText: "Bạn đang nghĩ gì?",
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildcategorychooseIconfield() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: _contentcontroller, // Gán controller cho TextFormField
            keyboardType: TextInputType.multiline,
            textAlignVertical:
                TextAlignVertical.top, // Căn chỉnh văn bản ở trên cùng
            decoration: InputDecoration(
              hintText: "Bạn đang nghĩ gì?",
              hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildcategorychooseBackgroundcolorfield() {
    return GestureDetector(
      onTap: () {
        _buildCategoryBottomSheet(context);
      },
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Chọn màu nền", style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  void _buildCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const ListTile(
                    leading: Icon(Icons.image, color: Colors.green),
                    title: Text("Ảnh/video"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text("Gắn thẻ người khác"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.emoji_emotions),
                    title: Text("Cảm xúc/hoạt động"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _gotonextpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const next()),
    );
  }
}
