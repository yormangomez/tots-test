import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tots/feature/main_dashboard/bloc/client_bloc.dart';
import 'package:tots/feature/main_dashboard/widget/app_creater_modal.dart';
import 'package:tots/feature/main_dashboard/widget/app_update_modal.dart';
import 'package:tots/feature/main_dashboard/widget/paint_clipper.dart';
import 'package:tots/feature/main_dashboard/widget/search_widet.dart';
import 'package:tots_ui/tots_ui.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({
    super.key,
  });

  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage>
    with TickerProviderStateMixin {
  final TextEditingController controllerSearch = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -160,
          right: 200,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 0.5),
            duration: const Duration(seconds: 2),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: ClipPath(
                  clipper: PaintClipper(), // Usa el clipper personalizado
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F353),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4F353).withOpacity(0.6),
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 8,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 200,
          left: 300,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 0.5),
            duration: const Duration(seconds: 2),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: ClipPath(
                  clipper: PaintClipper(), // Usa el clipper personalizado
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F353),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4F353).withOpacity(0.6),
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 8,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 690,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 0.5),
            duration: const Duration(seconds: 2),
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: ClipPath(
                  clipper: PaintClipper(), // Usa el clipper personalizado
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4F353),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4F353).withOpacity(0.6),
                          offset: const Offset(0.5, 0.5),
                          blurRadius: 8,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 34, bottom: 28),
                child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/3f9d/fba5/9cc32ba3aad3e60f4a9d383ad2b48eac?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JZ5FIQTiJjF-9snJwXrj2rbSi-vki0C-jTKQja3uwq9EUHuGtNf3lWrpgh4L-ESvOI-XZL5mxodT9TdlBI6B04PsxB-0tQH-KRqWteHdNT6SukrsGP2a2sqqeUNUQTWqmbUEC9u55rmAvBiqpGqpKWz1rzwTPIq5Hk7qEBFx-Hm~XU73pgjlrp8JSHv4OuXQBZ-yt7tmfmVU7yDNMeheOwbgn1Qk1OdUHwtlEbBKWk52QiMXPnjB-3XbXD~pebGnu8KGbI~tG59~ULPnFjqK0uTj~g8-Gcpa6WsyvDCUReY0ZqMb4H732mIQt0boJznp5HT5jBuzjOsns7SiS6KNNg__',
                  width: 128,
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'CLIENTS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: SearchWidet(
                      controllerSearch: controllerSearch,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => AppCreaterModal(),
                      );
                    },
                    child: Container(
                      height: 29,
                      width: 93,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: const Center(
                        child: Text(
                          'ADD NEW',
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'DrukText',
                              package: 'packages/klg_ui',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<ClientBloc, ClientState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 650,
                    width: double.infinity,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.clientList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => AppUpdateModal(
                                    firstName: state.clientList[index].firstname
                                        .toString(),
                                    lastName: state.clientList[index].lastname
                                        .toString(),
                                    email: state.clientList[index].email
                                        .toString(),
                                    id: state.clientList[index].id.toString(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 90,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 16, right: 12),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              "https://gravatar.com/avatar/00e6b1a1b95675680ba8dafabe92d850?s=400&d=robohash&r=x",
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${state.clientList[index].firstname} ${state.clientList[index].lastname}'),
                                              Text(state.clientList[index].email
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 16),
                                      child: Icon(Icons.more_vert_sharp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 52,
                width: 296,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ClientBloc>().add(const GetClientEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'LOAD MORE',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
