bool busy
byte mutex
active[2] proctype P()
{
  (!busy) -> busy =true;
  mutex++;
  CS: printf("P-%d in CS \n", _pid);
   assert(mutex <=1);
  mutex--;
  busy = false;

}

