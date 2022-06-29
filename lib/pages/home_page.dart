import 'package:chang_mini/components/bank_container.dart';
import 'package:chang_mini/config/colors.dart';
import 'package:chang_mini/pages/add_page.dart';
import 'package:chang_mini/services/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<BankService>(
      builder: (context, service, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: TossColor.grey1,
            elevation: 0,
            title: Image.asset(
              'assets/toss_logo.png',
              height: 48,
            ),
            centerTitle: false,
            actions: [
              Image.asset(
                'assets/toss_appbar_icon_1.png',
                height: 48,
                width: 48,
              ),
              const SizedBox(width: 16),
              Image.asset(
                'assets/toss_appbar_icon_2.png',
                height: 36,
                width: 36,
              ),
              const SizedBox(width: 16),
              Image.asset(
                'assets/toss_appbar_icon_3.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: TossColor.grey1,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: TossColor.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              bottom: 4,
                            ),
                            child: const Text(
                              '자산',
                              style: TextStyle(
                                color: TossColor.bluegrey,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AddPage()),
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                      ...service.myBankList.map(
                        (e) => BankContainer(bank: e),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
