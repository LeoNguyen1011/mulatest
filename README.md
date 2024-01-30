# Introduction 


TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started

TODO: Guide users through getting your code up and running on their own system. In this section you can talk about:
1.	Installation process
2.	Software dependencies
3.	Latest releases
4.	API references

# Build and Test

TODO: Describe and show how to build your code and run the tests. 

# Contribute

TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)~~~~
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)


# Project Flutter with Bloc Pattern

## Flutter version

```3.10.6```

## Packages

- [Bloc Pattern: flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Navigation: auto_route](https://pub.dev/packages/auto_route)
- [DI: get_it](https://pub.dev/packages/get_it)
- [Network: dio](https://pub.dev/packages/dio)
- [Localization: easy_localization](https://pub.dev/packages/easy_localization)
- [Flavors: production, dev, staging](https://docs.flutter.dev/deployment/flavors)
- [Model generator: Freezed](https://pub.dev/packages/freezed)
- [Dio client generator: retrofit](https://pub.dev/packages/retrofit)
-  ...



## Installation

Generate code command:

```bash
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
```

Generate localization command:
```bash
flutter pub get && flutter pub run easy_localization:generate -f keys -S assets/translations -O lib/gen
```

## Project structure

```
 
│
└───base // contains base (bloc, state, ...) & network config
│    
└───common // contains app theme, config, extensions, common widgets ...
│   
└───di 
│   
└───features 
│   
└───routes // navigation
│   
└───main.dart
```

Feature structure
---
Use CLEAN architecture

![App Screenshot](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)
```
│
└───data
│   └─── model 
│   └─── remote
│            └─── service 
│            └─── source
│   └─── repository (impl)
└───domain
│   └─── repository (abstract)
│   └─── use_case
└───presentation
│   └─── bloc
│   └─── pages
│   └─── widgets
```

## Must use [BaseScaffold] and [BaseAppBar]!!!

eg:
```dart
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(),
      body: Column(),
    );
  }
}

```

## How to use pagination

- in bloc
  **Init the paging controller**, add **BaseCommonMethodMixin** mixin to bloc.

```dart
class xxxBloc extends BaseBloc<E, S> with BaseCommonMethodMixin{
    ...
    final PagingController<int, Player> pagingController =
      PagingController(firstPageKey: 0);
    ...


    //on fetch data
    Future onGetData(
      Emitter<ExampleState> emit, List<Player> players, int offset) async {

    final res = await _coreUseCase.getData(offset: offset, limit: 25);

    pagingControllerOnLoad(offset, pagingController, res);
    
  }
}
```

- in view
  **addPageRequestListener in initState** then use CustomListViewSeparated or another which match the case. See in paging_list_view.dart
```dart
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState
    extends BaseState<ExamplePage, ExampleEvent, ExampleState, ExampleBloc> {
  @override
  void initState() {
    super.initState();
    bloc.pagingController.addPageRequestListener(
      (pageKey) => bloc.add(
        ExampleEvent.getPlayers(
          players: bloc.state.players,
          offset: pageKey,
        ),
      ),
    );
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomListViewSeparated<Player>(
              separatorBuilder: (c, i) => const Divider(),
              controller: bloc.pagingController,
              builder: (c, item, i) => PlayerItem(
                data: item,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
## Dialog & bottomsheet
- at common/utils/
## Common widgets (button, textfield)
- at common/widgets/



## Flavor
Using
- [Flutter dotenv](https://pub.dev/packages/flutter_dotenv)


Config env in
```
│
└───assets
│   └─── evn
```
In Android
----------- 
Add google_services.json to
```
│
└───android
│   └─── app
│            └─── dev 
│            └─── staging
│            └─── production
```
Change applicationId & App name in android/app/build.gradle
```
    flavorDimensions "app"

    productFlavors {
        dev {
            dimension "app"
            resValue "string","app_name","Base Bloc Flutter 3 Dev"
            applicationId "com.mula.biz.dev"
        }
        staging {
            dimension "app"
            resValue "string","app_name","Base Bloc Flutter 3 Stagin"
            applicationId "com.mula.biz.staging"
        }
        production {
            dimension "app"
            resValue "string", "app_name", "Base Bloc Flutter 3"
        }

    }
```

```
    applicationId "com.mula.biz"
```
In IOS
------
Add google google_services.plist to
```
│
└───Runner
│   └─── config
│            └─── dev 
│            └─── staging
│            └─── production
```
Change Product Bundle Identifier in Runner/Targets/Runner/Build Setting/Product Bundle Identifier
Change App Display Name in Runner/Targets/Runner/Build Setting/User-Defined/APP_DISPLAY_NAME

## Push Notification
Using
- [Firebase Messing](https://pub.dev/packages/firebase_messaging)

Initial Firebase Message
```dart
    Future<void> initialize({Function(String)? handleNotificationOnTap,})
```

Listen onMessage
```dart
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        
    });
```
Listen onBackgroundMessage
```dart
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
```
Listen onMessage when App opened & handle onTap notification
```dart
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          
    });
```

## Local Notification
Using
- [Flutter Local Notification](https://pub.dev/packages/flutter_local_notifications)


Init local Notification
```dart
    Future<void> init()
```


Show Notification
```dart
    Future<void> showNotification({
    required String title,
    required String body,
    String channelId = NotificationConfig.highChannelId,
    String? payload,
    Importance? importance,
    Priority? priority,
  }){}
```

Hanlde onTap Notification
```dart
    Future<dynamic> selectNotification(String? payload) async {
    }
```
 
 