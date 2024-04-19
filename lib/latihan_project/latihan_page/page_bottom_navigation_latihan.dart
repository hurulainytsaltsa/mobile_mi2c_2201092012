import 'package:flutter/material.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_list_berita_latihan.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_list_pegawai_latihan.dart';
import 'package:mi2c_mobile/latihan_project/latihan_page/page_profile_user_latihan.dart';

class PageBottomNavigationLatihan extends StatefulWidget {
  const PageBottomNavigationLatihan({super.key});

  @override
  State<PageBottomNavigationLatihan> createState() =>
      _PageBottomNavigationLatihanState();
}

class _PageBottomNavigationLatihanState
    extends State<PageBottomNavigationLatihan>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          PageListLatihanBerita(),
          PageListPegawai(),
          PageProfileUser(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabController?.index ?? 0,
        onTap: (index) {
          tabController?.animateTo(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Berita",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_sharp),
            label: "List User",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
