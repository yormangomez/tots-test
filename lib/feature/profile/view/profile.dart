// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tots_ui/tots_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResponsiveProfileScreen(),
    );
  }
}

class ResponsiveProfileScreen extends StatefulWidget {
  const ResponsiveProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResponsiveProfileScreenState createState() =>
      _ResponsiveProfileScreenState();
}

class _ResponsiveProfileScreenState extends State<ResponsiveProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1366;
    final bool isDesktop = MediaQuery.of(context).size.width >= 1366;

    return Scaffold(
      key: _scaffoldKey,
      appBar: isDesktop
          ? null
          : (isTablet ? _buildTabletAppBar() : _buildMobileAppBar()),
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                if (isDesktop) _buildDesktopTabBar(),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: _tabs,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildMobileAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'MI PERFIL',
                style: UITextStyle.captions.captionMedium.copyWith(
                  fontFamily: 'Druk Text Wide - Medium',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                'Perfil',
                //'Mis cartas',
                'División',
                'Misiones',
              ].map((e) => Tab(text: e)).toList(),
              labelColor: const Color.fromRGBO(247, 176, 34, 1),
              unselectedLabelColor: const Color.fromRGBO(255, 255, 255, 1),
              indicatorWeight: 1,
              labelStyle: UITextStyle.captions.captionMedium.copyWith(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Color.fromRGBO(247, 176, 34, 1),
                  width: 3,
                ),
                insets: EdgeInsets.symmetric(horizontal: -35),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildTabletAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 1.0),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'MI PERFIL',
                style: UITextStyle.captions.captionMedium.copyWith(
                  fontFamily: 'Druk Text Wide - Medium',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              tabs: [
                'Perfil',
                //'Mis cartas',
                'División',
                'Misiones',
              ].map((e) => Tab(text: e)).toList(),
              labelColor: const Color.fromRGBO(247, 176, 34, 1),
              unselectedLabelColor: const Color.fromRGBO(255, 255, 255, 1),
              indicatorWeight: 3,
              labelStyle: UITextStyle.captions.captionMedium.copyWith(
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Color.fromRGBO(247, 176, 34, 1),
                  width: 3,
                ),
                insets: EdgeInsets.symmetric(horizontal: -75.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopTabBar() {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(30, 30, 30, 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'MI PERFIL',
            style: UITextStyle.captions.captionMedium.copyWith(
              fontFamily: 'Druk Text Wide - Medium',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ),
        Container(
          color: const Color.fromRGBO(30, 30, 30, 1.0),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Perfil'),
              // Tab(text: 'Mis Cartas'),
              Tab(text: 'División'),
              Tab(text: 'Misiones'),
            ],
            labelColor: const Color.fromRGBO(247, 176, 34, 1),
            unselectedLabelColor: const Color.fromRGBO(170, 170, 170, 1.0),
            indicatorColor: const Color.fromRGBO(247, 176, 34, 1),
            indicatorWeight: 3,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: -230),
            labelStyle: UITextStyle.captions.captionMedium.copyWith(
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Color.fromRGBO(247, 176, 34, 1),
                width: 3,
              ),
              insets: EdgeInsets.symmetric(horizontal: 0),
            ),
          ),
        ),
      ],
    );
  }
}
