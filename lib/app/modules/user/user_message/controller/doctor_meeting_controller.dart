import 'package:dyte_core/dyte_core.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class DoctorMeetingController extends GetxController
    implements
        DyteMeetingRoomEventsListener,
        DyteParticipantEventsListener,
        DyteChatEventsListener {
  // DyteMobileClient is manager to interact with dyte server.
  Rx<DyteMobileClient> dyteClient = DyteMobileClient().obs;
  // Remote peer will hold the remote peer information like name, video, audio so on.
  Rxn<DyteMeetingParticipant> remotePeer = Rxn<DyteMeetingParticipant>();
  // isAudioOn is used to get and set local user audio status
  Rx<bool> isAudioOn = false.obs;
  // isVideoOn is used to get and set local user video status
  Rx<bool> isVideoOn = true.obs;
  // Room Join status
  Rx<bool> roomJoin = false.obs;
  // chess game fen
  Rx<String> fen = "".obs;
  // Local User Colour.
  // Rx<int> playerColor = Squares.white.obs;
  // Bishop is used for validating chess moves.
  // ChessBoard state
  // late Rx<SquaresState> state;
  // Username is used to assign value in room.
  Rx<String> username = "".obs;
  // Is local user turn
  Rx<bool> localUserTurn = false.obs;
  // Dyte Room Id
  Rx<String> roomId = "".obs;

  roomStateNotifier(
      String name, String token, String meetingId, bool isCall, bool isVideo) {
    username.value = name;
    roomId.value = meetingId;
    dyteClient.value.addMeetingRoomEventsListener(this);
    dyteClient.value.addParticipantEventsListener(this);
    dyteClient.value.addChatEventsListener(this);
    final meetingInfo = DyteMeetingInfoV2(
        authToken: token, enableAudio: true, enableVideo: true);
    dyteClient.value.init(meetingInfo);
  }

  sendMessage(String message) {
    dyteClient.value.chat.sendTextMessage(message);
  }

  toggleVideo() {
    if (isVideoOn.value) {
      dyteClient.value.localUser.disableVideo();
    } else {
      dyteClient.value.localUser.enableVideo();
    }
    isVideoOn.toggle();
  }

  toggleAudio() {
    if (isAudioOn.value) {
      dyteClient.value.localUser.disableAudio();
    } else {
      dyteClient.value.localUser.enableAudio();
    }
    isAudioOn.toggle();
  }

  @override
  void onMeetingInitCompleted() {
    dyteClient.value.localUser.setDisplayName(username.value);
    dyteClient.value.joinRoom();
    print("Join");
  }

  @override
  void onMeetingRoomJoinCompleted() {
    roomJoin.value = true;
  }

  @override
  void onMeetingRoomLeaveCompleted() {
    roomJoin.value = false;
    dyteClient.value.removeMeetingRoomEventsListener(this);
    dyteClient.value.removeParticipantEventsListener(this);
    dyteClient.value.removeChatEventsListener(this);
    dyteClient.value.leaveRoom();
    Get.back();
    Get.delete<DoctorMeetingController>();
  }

  @override
  void onParticipantJoin(DyteJoinedMeetingParticipant participant) {
    if (participant.userId != dyteClient.value.localUser.userId) {
      remotePeer.value = participant;
      assignColour();
    }
  }

  @override
  void onParticipantLeave(DyteJoinedMeetingParticipant participant) {
    // if (participant.userId != dyteClient.value.localUser.userId &&
    //     remotePeer.value != null) {
    //   remotePeer.value = null;
    //   Get.defaultDialog(
    //       barrierDismissible: false,
    //       onWillPop: () async {
    //         return false;
    //       },
    //       title: "Opponent Left this game.",
    //       textConfirm: "Leave",
    //       middleText: "",
    //       confirmTextColor: Colors.white,
    //       onConfirm: () {
    //         dyteClient.value.leaveRoom();
    //         Get.back();
    //       });
    // }
  }

  @override
  void onNewChatMessage(DyteChatMessage message) {
    if (message.userId == dyteClient.value.localUser.userId) {
      return;
    }
    // game.value.loadFen(fen);
    // // state.value = game.value.squaresState(playerColor.value);
    // if (game.value.checkmate) {
    //   Get.defaultDialog(
    //       barrierDismissible: false,
    //       title: "You lose the game",
    //       textConfirm: "Leave",
    //       middleText: "",
    //       confirmTextColor: Colors.white,
    //       onConfirm: () {
    //         dyteClient.value.leaveRoom();
    //         Get.back();
    //       });
    // }
    localUserTurn.value = true;
  }

  @override
  void onMeetingInitFailed(Exception exception) {
    print("onMeetingInitFailed $exception");
  }

  @override
  void onMeetingInitStarted() {}

  @override
  void onMeetingRoomDisconnected() {}

  @override
  void onMeetingRoomJoinFailed(Exception exception) {
    print("onMeetingRoomJoinFailed $exception");
  }

  @override
  void onMeetingRoomJoinStarted() {
    print("onMeetingRoomJoinStarted");
  }

  @override
  void onMeetingRoomLeaveStarted() {}

  @override
  void onActiveParticipantsChanged(List<DyteJoinedMeetingParticipant> active) {}

  @override
  void onActiveSpeakerChanged(DyteJoinedMeetingParticipant participant) {}

  @override
  void onAudioUpdate(
      bool audioEnabled, DyteJoinedMeetingParticipant participant) {}

  @override
  void onNoActiveSpeaker() {}

  @override
  void onParticipantPinned(DyteJoinedMeetingParticipant participant) {}

  @override
  void onParticipantUnpinned(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenSharesUpdated() {}

  @override
  void onVideoUpdate(
      bool videoEnabled, DyteJoinedMeetingParticipant participant) {}

  @override
  void onChatUpdates(List<DyteChatMessage> messages) {}

  @override
  void onDisconnectedFromMeetingRoom(String reason) {}

  @override
  void onMeetingRoomReconnectionFailed() {}

  @override
  void onReconnectedToMeetingRoom() {}

  @override
  void onReconnectingToMeetingRoom() {}

  // onUserMove(Move move) {
  //   if (game.value.makeSquaresMove(move)) {
  //     state.value = game.value.squaresState(playerColor.value);
  //     sendMessage(game.value.fen);
  //     localUserTurn.value = false;
  //   } else {
  //     Get.snackbar("Invalid move", "", snackPosition: SnackPosition.BOTTOM);
  //   }
  //   if (game.value.checkmate) {
  //     Get.defaultDialog(
  //         barrierDismissible: false,
  //         title: "You won the game",
  //         textConfirm: "Leave",
  //         middleText: "",
  //         confirmTextColor: Colors.white,
  //         onConfirm: () {
  //           dyteClient.value.leaveRoom();
  //           Get.back();
  //         });
  //   }
  // }

  assignColour() {
    List<String> peer = [
      dyteClient.value.localUser.userId,
      remotePeer.value!.userId
    ];
    peer.sort();
    if (peer.indexOf(dyteClient.value.localUser.userId) == 0) {
      // playerColor.value = Squares.white;
      localUserTurn.value = true;
    } else {
      // playerColor.value = Squares.black;
      localUserTurn.value = false;
    }
  }

  @override
  void onActiveTabUpdate(DyteActiveTab? activeTab) {}

  @override
  void onConnectedToMeetingRoom() {}

  @override
  void onConnectingToMeetingRoom() {}

  @override
  void onMeetingEnded() {}

  @override
  void onMeetingRoomConnectionFailed() {}

  @override
  void onScreenShareEnded(DyteJoinedMeetingParticipant participant) {}

  @override
  void onScreenShareStarted(DyteJoinedMeetingParticipant participant) {}

  @override
  void onUpdate(DyteParticipants participants) {}
}
