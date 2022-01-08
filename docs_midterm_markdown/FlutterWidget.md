<img src="https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png"/>

<h1 style="color: #696969">Flutter widgets</h1>

<h3 style="color: #696969"> Giới thiệu </h3>

   <p style="text-indent: 10px"> Flutter widgets được xây dựng lấy cảm hứng từ tư tưởng phân chia component của React. Ý tưởng trung tâm là xây dựng giao diện người dùng từ widgets - widgets mô tả giao diện sẽ trông như thế nào với cấu hình và trạng thái hiện tại. Khi trạng thái của widgets thay đổi, widgets sẽ xây dựng lại mô tả của nó, Flutter sẽ so sánh với mô tả trước đó để xác định những thay đổi tối thiểu cần thiết trong render tree để chuyển từ trạng thái này sang trạng thái khác. </p>

<h3 style="color: #696969">Stateless và StatefulWidget </h3>

<h4 style="color: #696969"> StatelessWidget </h4>

  <p style="text-indent: 10px"> Một widget thay đổi mà không cần đến trạng thái.
  </p>
  <p style="text-indent: 10px">
    StatelessWidget mô tả một  phần của giao diện người dùng bằng cách xây dựng một tập hợp các widget khác mô tả giao diện người dùng cụ thể hơn. Quá trình xây dựng  tiếp tục đệ quy cho đến khi mô tả giao diện  người dùng hoàn toàn cụ thể.
  </p>

<p style="text-indent: 10px">
    StatelessWidget rất hữu ích khi phần giao diện người dùng mà bạn đang mô tả không phụ thuộc vào bất cứ điều gì khác ngoài thông tin cấu hình trong chính đối tượng và BuildContext mà trong đó widget bị tác động đến. Đối với những thứ có thể thay đổi linh hoạt, ví dụ: do có trạng thái điều khiển đồng hồ nội bộ hoặc tùy thuộc vào một số trạng thái hệ thống, hãy cân nhắc sử dụng StatefulWidget.

</p>

<h4 style="color: #696969"> StatefulWidget </h4>

  <p style="text-indent: 10px">Một widget có trạng thái có thể thay đổi.
    Trạng thái là thông tin mà (1) có thể được đọc đồng bộ khi widget được xây dựng và (2) có thể thay đổi trong suốt vòng đời của widget. Trách nhiệm của người thực hiện widget là đảm bảo rằng trạng thái được thông báo kịp thời khi trạng thái đó thay đổi, sử dụng State.setState.
  </p>

  <p style="text-indent: 10px">
    Cũng như StatelessWidget, StatefulWidget cũng xây dựng một tập hợp các widget để mô tả giao diện người dùng. Quá trình diễn ra đệ quy đến khi giao diện hiển thị hoàn toàn.
  </p>

  <p style="text-indent: 10px">
    StatefulWidget rất hữu ích khi một phần của giao diện người dùng mà bạn đang mô tả có thể thay đổi linh hoạt, ví dụ: do có trạng thái điều khiển nội bộ hoặc tùy thuộc vào một số trạng thái hệ thống. Đối với các bố cục chỉ phụ thuộc vào thông tin cấu hình trong chính đối tượng và BuildContext trong đó widget bị tác động đến, hãy cân nhắc sử dụng StatelessWidget.
  </p>

<h4 style="color: #696969"> Ví dụ StatelessWidget </h4>

- StatelessWidget:

```dart
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar(title: Text("App Bar")),
      body: const Center(child: Text("Hello world")),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
```

- StatefulWidget:

```dart
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        const SizedBox(width: 16),
        Text('Count: $_counter'),
      ],
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Counter(),
        ),
      ),
    ),
  );
}

```

<h4 style="color: #696969"> Inherited widgets </h3>

<h4 style="color: #696969"> Thuộc tính key của widgets </h4>

<h3 style="color: #696969"> Built-in widgets </h3>

<h4 style="color: #696969">1. Widgets cơ bản </h4>

- Text widgets:
  <p style="text-indent: 10px">Text hiển thị một chuỗi kí tự có thể thay đổi định dạng</p>

  ```dart
    Text(
      "Hello from Flutter Text",
      style: TextStyle(
        color: Color.fromRGBO(105, 105, 105, 1),
        fontSize: 14,
        fontWeight: FontWeight.bold
      )
    )
  ```

- Các thuộc tính phổ biến của Text widget:

  - <code>style:</code> Chỉnh sửa định dạng của chữ. Có thể dùng để thay đổi màu chữ, phông chữ, kiểu chữ, v.v.
  - <code>textAlign:</code>Vị trí dọc hay ngang của chữ, ví dụ như căn giữa, căn trái, căn đều hai bên, v.v.
  - <code>maxLine:</code> Tổng số dòng của chữ, dòng chữ có thể bị cắt ngắn nếu quá số chữ trong dòng đã được khai báo bởi thuộc tính này
  - <code>overflow:</code> Khai báo cách chữ sẽ như thế nào nếu quá dài, ví dụ như thêm dấu tỉnh lược (...) vào cuối dòng

- Image widgets:

  - Image hiển thị hình ảnh từ nhiều nguồn và định dạng khác nhau. Theo tài liệu chính thức từ Flutter, những định dạng được hỗ trợ là JPEG, PNG, GIF, GIF động, WebP, WebP động, BMP và WBMP, ví dụ:

    ```dart
      Image(
        image: AssetImage(
          "assets/pretty_dog.jpg",
        )
      )
    ```

  - Lớp Image có nhiều hàm tạo để hiển thị hình ảnh theo cách khác nhau:

    - <code>Image("https:/​/api.​flutter.​ dev/​flutter/​widgets/​Image/​Image/html") </code>.
    - <code>Image.asset("https:/​/api.​ flutter.​dev/​flutter/​widgets/​ImageImage.asset.​html")</code> tạo ra <code>AssetImage</code>, bao gồm hình ảnh từ <code>AssetBundle</code> sử dụng <code>asset</code> key, ví dụ:

    ```dart
      Image.asset(
        "https://i.pinimg.com/736x/49/80/34/498034176ebe53465fb44b4c99955a6b.jpg"
      )
    ```

    - <code>Image.network</code> tạo ra một <code>NetworkImage</code> để hiển thị ảnh từ URL, ví dụ:

    ```dart
      Image.network(
        "https://i.pinimg.com/originals/a7/01/77/a7017788074c65f4f46e59ca826f4d6b.jpg",
      )
    ```

    - <code>Image.file</code> tạo ra <code>FileImage</code> hiển thị ảnh từ file, ví dụ:

    ```dart
      Image.file(
        File(file_path),
      )
    ```

    - <code>Image.memory</code> tạo ra <code>MemoryImage</code> để hiển thị ảnh từ <code>Uint8List</code>, ví dụ:

  ```dart
    Image.memory(
      Uint8List(image_bytes),
    )
  ```

  - Các thuộc tính của <code>Image:</code>

    - <code>height/width:</code> điều chỉnh kích thước của hình ảnh
    - <code>repeat:</code> Lặp lại hình ảnh trong vùng hiển thị
    - <code>alignment:</code> vị trí hình ảnh
    - <code>fit:</code> cách hình ảnh hiển thị trong vùng hiển thị

- Material Design và iOS Cupertino widgets

  - Button:

    - Material Design
      - <code>TextButton</code>
      - <code>OutlinedButton</code>
      - <code>ElevatedButton</code>
      - <code>ToggleButton</code>
      - <code>FloatingActionButton</code>
      - <code>IconButton</code>
      - <code>DropdownButton</code>
      - <code>PopupMenuButton</code>
    - iOS Cupertino Button:
      - Sử dụng lớp CupertinoButton.
    - Scaffold hiện thực cấu trúc căn bản của một Material Design hoặc iOS Cupertino layout. Với Material Design, <code>Scaffold</code> widget sẽ bao gồm một tập hợp các Material Design component:

      - <code>body:</code> hiển thị nội dung, thường nằm bên dưới <code>AppBar</code>.
      - <code>AppBar:</code> bao gồm một thanh công cụ và các widget có chức năng khác.
      - <code>TabBar:</code> hiển thị các tab. Thường là một phần của <code>AppBar</code>.
      - <code>TabBarView:</code> Dạng xem trang hiển thị widget tương ứng với tab hiện đã chọn. Thường được sử dụng kết hợp với TabBar và được sử dụng như một body widget.
      - <code>BottomNavigationBar:</code> chuyển đổi nhanh giữa các màn hình.
      - <code>Drawer:</code> Bảng điều khiển trượt theo chiều ngang từ cạnh của một giàn giáo để hiển thị liên kết dẫn hướng trong ứng dụng.

    - Với iOS Cupertino, cấu trúc sẽ có khác biệt đôi chút. Các lớp có thể sử dụng là CupertinoPageScaffold và CupertinoTabScaffold

      - <code>CupertinoPageScaffold:</code> thanh dẫn hướng ở trên, thường sử dụng kèm với <code>CupertinoTabScaffold</code>.
      - <code>CupertinoTabScaffold:</code> thanh tab nằm ở dưới, thường đi kèm <code>CupertinoTabScaffold</code>.

  - Dialogs:

    - Material Design:

      - Simple Dialog
      - Alert Dialog

    - iOS Cupertino:

      - CupertinoDialog
      - CupertinoAlertDialog

  - Text fields: hiển thị bàn phím để người dùng nhập vào, Material Design có TextField và iOS Cupertino có CupertinoTextField, cả 2 đều có các thuộc tính như sau:

    - <code>autofocus</code>
    - <code>enable</code>
    - <code>keyboardType</code>

  - Selection widgets:

    - Material Design:

      - <code>Checkbox</code>
      - <code>Radio</code>
      - <code>Switch</code>
      - <code>Slider</code>

    - iOS Cupertino:

      - <code>CupertinoActionSheet</code>
      - <code>CupertinoPicker</code>
      - <code>CupertinoSegmentedControl</code>
      - <code>CupertinoSlider</code>
      - <code>CupertinoSwitch</code>

  - Date and time pickers:

    - Material Design:

      - <code>showDatePicker</code>
      - <code>showTimePicker</code>

    - iOS Cupertino:

      - <code>CupertinoDatePicker</code>
      - <code>CupertinoTimerPicker</code>

  - Others components: Tuy có một số component giống nhau về cách sử dụng, tuy nhiên mỗi bên cũng có các component đặc trưng cho nền tảng của mình, ví dụ như với Material Design là <code>Card</code>

<h3 style="color: #696969"> Hiểu sâu hơn về built-in layout widgets</h3>

1. Container

   - Hiển thị một widget duy nhất trên màn hình không phải là một cách tốt để tổ chức một UI. Thường thì chúng ta sẽ tạo ra danh sách các widget được tổ chức một cách cụ thể bằng cách sử dụng các widget container.
   - Được sử dụng phổ biến là <code>Row</code> và <code>Column</code>, cả 2 đều có thuộc tính <code>children</code> để hiển thị danh sách các widget con sẽ được hiển thị theo một hướng cụ thể (rằng là, một danh sách ngang cho <code>Row</code> , hoặc một danh sách dọc cho <code>Column</code>).
   - Một widget được sử dụng rộng rãi khác là <code>Stack</code>, tổ chức children theo lớp, nơi child có thể chồng chéo một child khác một phần hoặc toàn bộ.

1. Styling và positioning
1. Các widget khác (gestures, animations và transformations)

<h3 style="color: #696969"> Ví dụ tạo một giao diện màn hình</h3>

- Phần hiển thị nội dung:

```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pinterest/controllers/api_provider.dart';
import 'package:pinterest/models/photos.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest/views/views.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ApiProvider _apiProvider = ApiProvider();
  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: _apiProvider.fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: StaggeredGridView.countBuilder(
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                controller: widget.scrollController,
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 1),
                itemCount: snapshot.data!.length,
                crossAxisCount: 4,
                itemBuilder: (context, index) {
                  final _imageHeight =
                      snapshot.data![index].imageHeight!.toDouble();
                  final _imageWidth =
                      snapshot.data![index].imageWidth!.toDouble();
                  return GestureDetector(
                    onTap: () {
                      final _photoDetails = snapshot.data![index];
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  Details(photoDetails: _photoDetails)));
                    },
                    child: SizedBox(
                      height: _imageHeight,
                      width: _imageWidth,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.circular(20)),
                          child: Image(
                            image: NetworkImage(
                                snapshot.data![index].webformatURL),
                            fit: BoxFit.cover,
                          )),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

```

- Giao diện tổng quan:

```dart
import 'package:flutter/material.dart';
import 'package:pinterest/views/components/appbar.dart';
import 'package:pinterest/views/components/bottom_appbar.dart';
import 'package:pinterest/views/main_screens/home/home_body.dart';

class Home extends StatefulWidget {
const Home({Key? key}) : super(key: key);
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
final ScrollController _scrollController = ScrollController();
bool _showBackToTopButton = false;

@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}

@override
void initState() {
  super.initState();
  _scrollController.addListener(() {
    setState(() {
      if (_scrollController.offset >= 50) {
        _showBackToTopButton = true;
      } else {
        _showBackToTopButton = false;
      }
    });
  });
}

void _handleScrollTop() async {
  await Future.delayed(const Duration(milliseconds: 300));
  _scrollController.animateTo(0.0,
      duration: const Duration(seconds: 2), curve: Curves.easeIn);
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBody: true,
    appBar: const ComponentAppBar(
      appBarHeight: 60,
      icon: Icon(Icons.person),
    ),
    backgroundColor: Colors.white,
    bottomNavigationBar: const ComponentBottomNavigationBar(),
    body: HomeBody(
      scrollController: _scrollController,
    ),
    floatingActionButton: !_showBackToTopButton == false
        ? FloatingActionButton(
            onPressed: _handleScrollTop,
            child: const Icon(Icons.arrow_upward_rounded),
          )
        : null,
  );
}
}

```

<h3 style="color: #696969">Tạo custom widgets</h3>
<h3 style="color: #696969">Tổng kết</h3>
