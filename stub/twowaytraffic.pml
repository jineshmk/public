//Two way traffic light

mtype ={RED,GREEN}
bool s1=RED, s2=GREEN;

proctype TL1() {
    do
        :: atomic{ s1 == RED -> s1 = GREEN}

    od
    }
proctype TL2() {
    do
    
    od
    }

init{
 //Add code here
}


