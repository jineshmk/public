
bool x,y ,t
byte mutex
ltl claim1 {[](A@CS1 -> mutex <=1)}
active proctype A()
{
   x = true;
   t = true;
   y == false || t == false ;
   mutex++;
   CS1:   assert(mutex<=1)
   mutex--;
   x = false;
}

active proctype B()
{
   y = true;
   t = false;
   x== false || t == true;
   mutex++;
   CS2:  assert(mutex<=1)
   mutex--;
   y = false;
}
