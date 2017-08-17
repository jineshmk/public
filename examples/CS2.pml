bool x,y 
byte mutex
active proctype A()
{
   x = true;
   y == false;
   mutex++;
   CS: assert(mutex<=1)
   mutex--;
   x = false;
}

active proctype B()
{
   y = true;
   x== false;
   mutex++;
   CS:   assert(mutex<=1)
   mutex--;
   y = false;
}
