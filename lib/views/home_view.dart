import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/food_controller.dart';
import '../widgets/category_button_widget.dart';
import '../widgets/food_item_widget.dart';

class HomeView extends StatelessWidget {
  final FoodController controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Kategori tombol bagian atas dengan desain melengkung
          _buildCategorySection(),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.foodItems.length,
                itemBuilder: (context, index) {
                  var meal = controller.foodItems[index];
                  return FoodItemWidget(foodItem: meal);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Widget untuk bagian kategori dengan desain melengkung
  Widget _buildCategorySection() {
    return Stack(
      children: [
        // Background melengkung dengan warna E95322
        ClipPath(
          clipper: CategoryClipper(),
          child: Container(
            height: 150,
            color: Color(0xFFE95322),  // Warna oranye E95322
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryItem(Icons.restaurant_menu, 'Meal', true),
              _buildCategoryItem(Icons.fastfood_outlined, 'Snack', false),
              _buildCategoryItem(Icons.local_drink_outlined, 'Drinks', false),
            ],
          ),
        ),
      ],
    );
  }

  // Widget untuk item kategori
  Widget _buildCategoryItem(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isActive ? Colors.amber : Colors.amber.shade100,
          radius: isActive ? 40 : 35,
          child: Icon(icon, color: Colors.red, size: isActive ? 40 : 30),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: isActive ? 16 : 14,
          ),
        ),
      ],
    );
  }

  // AppBar dengan field pencarian kecil dan ikon pengaturan di dalam search bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber.shade400,  // Warna kuning untuk AppBar
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,  // Ukuran lebih kecil untuk search bar
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),  // Sudut melengkung
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.search, color: Colors.grey),  // Ikon pencarian
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',  // Teks di dalam pencarian
                        border: InputBorder.none,  // Hilangkan border default
                      ),
                    ),
                  ),
                  // Ikon pengaturan di dalam search bar
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFE95322),  // Warna oranye untuk tombol
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.tune, color: Colors.white),  // Ikon pengaturan
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Tombol lonceng, shop, dan titik tiga di sisi kanan
        IconButton(
          icon: Icon(Icons.notifications_outlined, color: Colors.orange),  // Ikon lonceng
          onPressed: () {
            // Aksi ketika ikon lonceng ditekan
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),  // Ikon shop
          onPressed: () {
            // Aksi ketika ikon shop ditekan
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white),  // Ikon titik tiga
          onPressed: () {
            // Aksi ketika ikon titik tiga ditekan
          },
        ),
      ],
    );
  }

  // BottomNavigationBar dengan ikon oranye dan kuning
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.deepOrange,  // Warna latar belakang oranye
      selectedItemColor: Colors.amberAccent.shade100,  // Warna ikon kuning
      unselectedItemColor: Colors.amberAccent.shade100,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
    );
  }
}

// Custom clipper untuk background melengkung
class CategoryClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
