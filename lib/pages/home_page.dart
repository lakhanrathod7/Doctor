
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/users.dart';
import '../model/user.dart';
import '../provider/feedback_posittion_provider.dart';
import '../widgets/user_card_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = dummyUsers;
  final List<User> likedUsers = []; // Track liked users
  int currentUserIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: Text(
        "Appointment Book",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        )
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          users.isEmpty
              ? Center(
            child: Text(
              'No more users',
              style: TextStyle(color: Colors.white),
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(children: users.map(buildUser).toList()),
          ),
          Expanded(child: Container()),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         if (currentUserIndex > 0) {
          //           setState(() {
          //             currentUserIndex--; // Show the previous user
          //           });
          //         }
          //       },
          //       icon: Icon(Icons.arrow_back_ios),
          //       color: Colors.white,
          //     ),
          //     IconButton(
          //       onPressed: () {
          //         if (currentUserIndex < users.length - 1) {
          //           setState(() {
          //             currentUserIndex++; // Show the next user
          //           });
          //         }
          //       },
          //       icon: Icon(Icons.arrow_forward_ios),
          //       color: Colors.white,
          //     ),
          //   ],
          // )
        ],
      ),
    ),
  );

  Widget buildUser(User user) {
    final userIndex = users.indexOf(user);
    final isUserInFocus = userIndex == users.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
        Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
        Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
        Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(
            user: user,
            isUserInFocus: isUserInFocus,
          ),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, User user) {
    final minimumDrag = 100; // Minimum drag distance
    final dragDistance = details.offset.dx;

    if (dragDistance > minimumDrag) {
      // Swiped Right - Add to liked users
      user.isLiked = true;
      likedUsers.add(user);
      setState(() => users.remove(user));
    } else if (dragDistance < -minimumDrag) {
      // Swiped Left - Discard the user
      user.isSwipedOff = true;
      setState(() => users.remove(user));
    } else {
      // If the card returns to the center, do nothing
      // Reset the feedback position if needed
      final provider =
      Provider.of<FeedbackPositionProvider>(context, listen: false);
      provider.resetPosition();
    }
  }
}



