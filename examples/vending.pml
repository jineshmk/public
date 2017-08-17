/*Example promela VENDING machine program
Author Jinesh M.K
*/

#define COFFEEPRICE 10
#define TEAPRICE   5
#define COFFEE   1
#define TEA    0
/*Channel Definition */
chan drink_channel=[1] of {bit};
chan coin_channel=[1] of {byte};
bool paid; 
bool happy;
/**Verification rule */
ltl p0 {[](paid implies <>happy)}

/*Customer process*/
proctype customer(byte price){
  	happy=0;
	paid=0;
printf("price =%d",price);
	if
		::price!=COFFEEPRICE&&price!=TEAPRICE -> goto cus_end;
		::else->skip;
	fi;
	
	bit drink;
	coin_channel!price;
	paid=1;
	drink_channel?drink;
	if
		::price==COFFEEPRICE&&drink==COFFEE -> happy=1;
		::price==TEAPRICE&&drink==TEA -> happy=1;			
	::else ->skip;		
	fi;
	
        cus_end: printf("Customer Happy =%d\n",happy);

}

/*Vendor Process */
proctype vender() {
	byte price;
	coin_channel?price;
	if
		::price==COFFEEPRICE -> drink_channel!COFFEE;
		::price==TEAPRICE -> drink_channel!TEA;
		::else ->skip;
	fi
}

init{
run vender();
run customer(10);

}


	

