void main() async {
  final post = await fetchPost();
  print('Title: ${post.title}');
  print('Content: ${post.content}');

  generate().listen((value) {
    print(value);
  });
}

Future<Post> fetchPost() async{
  await Future.delayed(Duration(seconds: 2));
  return Post("My Post", "This is the content of my post.");
}

class Post {
  final String title;
  final String content;

  Post(this.title, this.content);

}

Stream<int> generate() async*{
  for (int i = 0; i < 4; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}