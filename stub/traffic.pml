mtype = { RED, YELLOW, GREEN } ;
byte state = GREEN;
ltl liv1 {[]<>(state == GREEN)}
ltl liv2 {[](state == RED -><>(state==GREEN))}
active proctype TrafficLight() {
do
:: (state == GREEN) -> state = YELLOW;
:: (state == YELLOW) -> state = RED;
:: (state == RED) -> state = GREEN;
od;
} 
