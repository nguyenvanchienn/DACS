import 'package:flutter/material.dart';
import 'package:tourn/Ui/main/category/home/buttom_add/add%20and%20edit/create_and_edit_content.dart';
import 'package:tourn/Ui/main/category/home/buttom_profile/profile.dart';
import 'package:tourn/Ui/main/category/home/buttom_search.dart/search.dart';

class homepage extends StatelessWidget {
  final bool isFirsTimeinstallApp; // Biến để kiểm tra lần đầu cài đặt ứng dụng

  const homepage({super.key, required this.isFirsTimeinstallApp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Tắt nút back tự động
        title: const Text(
          'Tourn',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          // Nút menu ở góc phải
          Container(
            margin: const EdgeInsets.symmetric(vertical: 14),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                // Xử lý khi nhấn nút menu
                _buildCategoryBottomSheet(context);
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              iconSize: 20,
              icon: const Icon(Icons.add, color: Colors.black),
            ),
          ),
          IconButton(
            onPressed: () {
              // Xử lý khi nhấn nút menu
              _gotosearchpage(context);
            },
            padding: const EdgeInsets.all(4),
            constraints: const BoxConstraints(),
            iconSize: 25,
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),

      body: SafeArea(
        // Đảm bảo không bị che khuất bởi notch hoặc thanh trạng thái
        child: SingleChildScrollView(
          // Cho phép cuộn nếu nội dung vượt quá
          child: Column(
            children: [
              _buildprofilepagelayout(context),
              _buildproposepage(),
              _buildhomepagelayout(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildprofilepagelayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // Hiệu ứng bóng
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1, // Độ lan rộng của bóng
            blurRadius: 4, // Độ mờ của bóng
            offset: const Offset(0, 2), // Vị trí của bóng
          ),
        ],
      ),
      child: Row(
        children: [
          _buildprofilebuttom(context),
          const SizedBox(
            width: 12,
          ), // Khoảng cách giữa ảnh đại diện và nội dung
          Expanded(
            child: _buildcontenthome(context),
          ), // Phần nội dung chính mở rộng
          const SizedBox(width: 12), // Khoảng cách giữa nội dung và nút
          _buildimages(),
        ],
      ),
    );
  }

  Widget _buildprofilebuttom(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Xử lý khi nhấn nút đến trang profile
        _gotoprofilepage(context);
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 2),
        ),
        child: ClipOval(
          child: Image.asset(
            'asset/images/anh-mo-ta.jpg',
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildcontenthome(BuildContext context) {
    return InkWell(
      // Sử dụng InkWell để có hiệu ứng nhấn
      onTap: () {
        _buildCategoryBottomSheet(context);
      },
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Text(
          'Cảm nghĩ của bạn...',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildimages() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: IconButton(
        onPressed: () {
          // Xử lý khi nhấn nút chọn ảnh
        },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.photo_library_outlined,
          color: Colors.grey.shade700,
          size: 22,
        ),
      ),
    );
  }

  Widget _buildproposepage() {
    return Container();
  }

  Widget _buildhomepagelayout() {
    return Container();
  }

  void _gotosearchpage(BuildContext context) {
    // Hàm chuyển đến trang chính của ứng dụng search.dart
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const search()),
    );
  }

  void _gotoprofilepage(BuildContext context) {
    // Hàm chuyển đến trang chính của ứng dụng profile.dart
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const profile()),
    );
  }
}

void _buildCategoryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Cho phép cuộn nội dung
    backgroundColor: Colors.transparent,
    isDismissible: true, // Đảm bảo ấn ra ngoài sẽ đóng
    enableDrag: true, // Cho phép kéo để đóng
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (context) {
      return GestureDetector(
        // Bắt sự kiện chạm ngoài để đóng
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: LayoutBuilder(
          // Sử dụng LayoutBuilder để lấy kích thước
          builder: (context, constraints) {
            // Tính chiều cao tối đa của nội dung
            final double maxSheetHeight =
                330; // hoặc tự động tính theo nội dung
            return DraggableScrollableSheet(
              initialChildSize:
                  0.45, // Kích thước ban đầu (40% chiều cao màn hình)
              minChildSize:
                  0.3, // Kích thước tối thiểu (20% chiều cao màn hình)
              maxChildSize: (maxSheetHeight / constraints.maxHeight).clamp(
                0.0,
                1.0,
              ),
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap:
                        true, // Cho phép nội dung co lại theo kích thước
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: 60,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Tạo bài viết',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(); // Đóng bottom sheet
                          // Chuyển đến trang tạo và chỉnh sửa nội dung
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const createandeditcontent(),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.edit, color: Colors.black),
                          title: Text("Tạo bài viết"),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.location_on, color: Colors.black),
                        title: Text("Check in"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.movie, color: Colors.black),
                        title: Text("Thước phim"),
                      ),
                      const ListTile(
                        leading: Icon(Icons.videocam, color: Colors.red),
                        title: Text(
                          "Phát trực tiếp",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const ListTile(
                        leading: Icon(Icons.poll, color: Colors.black),
                        title: Text("Tạo cuộc thăm dò ý kiến"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
