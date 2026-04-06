import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class PlannerChatWidget {

  static Widget plannerChatWidget({
    required int index,
    required BuildContext context,
    required PlannerChatController plannerChatController,
  }) {
    bool isSender = (plannerChatController.plannerMyProfileDetailsResponseModel.value.data?.sId ==
        plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.sId);

    /// 🔍 Detect image
    bool isImage(String url) {
      final ext = url.split('.').last.toLowerCase();
      return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(ext);
    }

    final allUrls = plannerChatController.getAllMessageResponseModel.value.data?[index].imageUrl ?? [];

    final imageList = allUrls.where((url) => isImage(url)).toList();

    final fileList = allUrls.where((url) => !isImage(url)).toList();

    return Container(
      margin: EdgeInsets.only(bottom: 20.bpm(context)),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSender) ...[
            ImageHelperWidget.circleImageHelperWidget(
              width: 32.w(context),
              height: 32.h(context),
              verticalPadding: 1.vpm(context),
              horizontalPadding: 1.hpm(context),
              backgroundColor: ColorUtils.orange213,
              radius: 25.r(context),
              imageAsset: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl == null ? ImageUtils.noImage : null,
              imageUrl: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl,
            ),

            SpaceHelperWidget.h(10.w(context)),
          ],
          


          if(plannerChatController.getAllMessageResponseModel.value.data![index].text.toString().isNotEmpty == true)...[
            if(plannerChatController.getAllMessageResponseModel.value.data![index].text.toString().length < 35) ...[
              InkWell(
                onLongPress: () async {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) => PlannerDeleteBottomSheet(
                      isConversation: false,
                      chatId: "",
                      messageId: plannerChatController.getAllMessageResponseModel.value.data?[index].sId,
                      plannerChatController: plannerChatController,
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                  decoration: BoxDecoration(
                    color: isSender ? ColorUtils.blue181 : ColorUtils.white241,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r(context)),
                      topRight: Radius.circular(16.r(context)),
                      bottomLeft: Radius.circular(isSender ? 16.r(context) : 0),
                      bottomRight: Radius.circular(isSender ? 0 : 16.r(context)),
                    ),
                  ),
                  child: TextHelperClass.headingTextWithoutWidth(
                    context: context,
                    alignment: Alignment.centerLeft,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textColor: isSender ? ColorUtils.white255 : ColorUtils.black80,
                    text: plannerChatController.getAllMessageResponseModel.value.data?[index].text ?? "",
                  ),
                ),
              )
            ] else...[
              Expanded(
                child: InkWell(
                  onLongPress: () async {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => PlannerDeleteBottomSheet(
                        isConversation: false,
                        chatId: "",
                        messageId: plannerChatController.getAllMessageResponseModel.value.data?[index].sId,
                        plannerChatController: plannerChatController,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.vpm(context),horizontal: 12.hpm(context)),
                    decoration: BoxDecoration(
                      color: isSender ? ColorUtils.blue181 : ColorUtils.white241,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r(context)),
                        topRight: Radius.circular(16.r(context)),
                        bottomLeft: Radius.circular(isSender ? 16.r(context) : 0),
                        bottomRight: Radius.circular(isSender ? 0 : 16.r(context)),
                      ),
                    ),
                    child: TextHelperClass.headingTextWithoutWidth(
                      context: context,
                      alignment: Alignment.centerLeft,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: isSender ? ColorUtils.white255 : ColorUtils.black80,
                      text: plannerChatController.getAllMessageResponseModel.value.data?[index].text ?? "",
                    ),
                  ),
                ),
              ),
            ]
          ] else...[
            Flexible(
              child: Column(
                crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (imageList.isNotEmpty)... [
                    InkWell(
                      onLongPress: () async {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) => PlannerDeleteBottomSheet(
                            isConversation: false,
                            chatId: "",
                            messageId: plannerChatController.getAllMessageResponseModel.value.data?[index].sId,
                            plannerChatController: plannerChatController,
                          ),
                        );
                      },
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: List.generate(imageList.length, (i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    final controllerPage =
                                    PageController(initialPage: i);
                                    return SafeArea(
                                      child: Scaffold(
                                        backgroundColor: Colors.black,
                                        body: PageView.builder(
                                          controller: controllerPage,
                                          itemCount: imageList.length,
                                          itemBuilder: (_, index) {
                                            return InteractiveViewer(
                                              child: Center(
                                                child: Image.network(
                                                    imageList[index]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageList[i],
                                width: imageList.length == 1
                                    ? 200
                                    : imageList.length == 2
                                    ? 140
                                    : 100,
                                height: imageList.length == 1
                                    ? 200
                                    : imageList.length == 2
                                    ? 140
                                    : 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ] else if(fileList.isNotEmpty)...[
                    InkWell(
                      onLongPress: () async {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) => PlannerDeleteBottomSheet(
                            isConversation: false,
                            chatId: "",
                            messageId: plannerChatController.getAllMessageResponseModel.value.data?[index].sId,
                            plannerChatController: plannerChatController,
                          ),
                        );
                      },
                      child: Column(
                        children: fileList.map((url) {
                          final fileName = url.split('/').last;

                          return StatefulBuilder(
                            builder: (context, setState) {
                              double progress = 0;
                              bool isDownloading = false;
                              bool isCompleted = false;

                              Future<void> download() async {
                                setState(() => isDownloading = true);

                                final dir =
                                await getApplicationDocumentsDirectory();
                                final path = "${dir.path}/$fileName";

                                await Dio().download(
                                  url,
                                  path,
                                  onReceiveProgress: (rec, total) {
                                    if (total != -1) {
                                      setState(() {
                                        progress = rec / total;
                                      });
                                    }
                                  },
                                );

                                setState(() {
                                  isDownloading = false;
                                  isCompleted = true;
                                });

                                OpenFile.open(path);
                              }
                              return Container(
                                margin: EdgeInsets.only(top: 6.tpm(context)),
                                padding: EdgeInsets.all(5.r(context)),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10.r(context)),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.insert_drive_file, color: Colors.blue),

                                    SpaceHelperWidget.h(5.w(context)),

                                    Expanded(
                                      child: TextHelperClass.headingTextWithoutWidth(
                                        context: context,
                                        alignment: Alignment.centerLeft,
                                        fontSize: 16,
                                        textOverFlow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        textColor: ColorUtils.black21,
                                        text: fileName,
                                      ),
                                    ),

                                    if (isDownloading)
                                      SizedBox(
                                        width: 24.w(context),
                                        height: 24.h(context),
                                        child: CircularProgressIndicator(
                                            value: progress),
                                      )
                                    else if (isCompleted)
                                      const Icon(Icons.check_circle,
                                          color: Colors.green)
                                    else
                                      IconButton(
                                        icon: const Icon(Icons.download),
                                        onPressed: download,
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],


          if (isSender) ...[

            SpaceHelperWidget.h(10.w(context)),

            ImageHelperWidget.circleImageHelperWidget(
              width: 32.w(context),
              height: 32.h(context),
              verticalPadding: 1.vpm(context),
              horizontalPadding: 1.hpm(context),
              backgroundColor: ColorUtils.orange213,
              radius: 25.r(context),
              imageAsset: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl == null ? ImageUtils.noImage : null,
              imageUrl: plannerChatController.getAllMessageResponseModel.value.data?[index].sender?.photoUrl,
            ),
          ],
        ],
      ),
    );
  }

}