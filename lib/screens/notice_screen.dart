import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/providers/notifications.dart';
import 'package:student_app/widgets/notice_card.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  bool _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<Notifications>(context, listen: false)
          .fetchAndSetNotifications();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationData =
        Provider.of<Notifications>(context, listen: false).newNotifications;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/dmi.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(0.6),
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: const Center(
                child: Text('NOTICES', style: kTitleTextStyleWhite)),
          ),
          _isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) => NoticeCard(
                    title: notificationData[index].title,
                    semester: 'Sem IV',
                    message: notificationData[index].message,
                  ),
                  shrinkWrap: true,
                  itemCount: notificationData.length,
                  physics: const NeverScrollableScrollPhysics(),
                ),
        ],
      ),
    );
  }
}
