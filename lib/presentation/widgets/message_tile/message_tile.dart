import 'package:test_lunapp/presentation/template/template.dart';

class MessageTile extends StatelessWidget {
  final String message;
  final String sender;
  final bool isUserMessage;

  const MessageTile({
    super.key,
    required this.message,
    required this.sender,
    required this.isUserMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SpacedRow(
        space: 2,
        mainAxisAlignment:
            isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isUserMessage)
            CustomImage(image: 'assets/icons/bot.png', width: 40.w),
          Row(
            children: [
              if (!isUserMessage)
                ClipPath(
                  clipper: TriangleClipperLeft(),
                  child: Container(
                    width: 13.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: ThemeColors.gray3,
                      border: Border.all(color: ThemeColors.gray3),
                    ),
                  ),
                ),
              Container(
                width: isUserMessage ? 215.w : 256.w,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                  color: isUserMessage ? ThemeColors.orange : ThemeColors.gray3,
                ),
                child: CustomText(
                  text: message,
                  textStyle: ThemeTextInter.s1294w400.apply(
                    color:
                        isUserMessage ? ThemeColors.black : ThemeColors.white,
                  ),
                ),
              ),
              if (isUserMessage)
                ClipPath(
                  clipper: TriangleClipperRight(),
                  child: Container(
                    width: 13.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                      color: ThemeColors.orange,
                      border: Border.all(color: ThemeColors.orange),
                    ),
                  ),
                ),
            ],
          ),
          if (isUserMessage)
            CustomImage(image: 'assets/icons/user.png', width: 40.w),
        ],
      ),
    );
  }
}
