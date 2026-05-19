void main()
{
   List? list1 = List.filled(3, null, growable: false);

   list1[0] = 'Mobile';
   list1[1] = 'App';
   list1[2] = 'Development';

   print(list1);
   print(list1[2]);
}