Future<void> fetch () {

   return Future.delayed(
      const Duration(seconds: 2),
      () => print('Basic user')
   );

}

void main() {

   fetch();

   print('Fetching data...');
}