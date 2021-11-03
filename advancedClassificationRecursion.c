#include <math.h>
#include <stdio.h>


#ifndef NumClass
#define NumClass
int isArmstrongRecur(int n, int count)
{
    if (n>0) {
        return pow(n%10, count)+isArmstrongRecur(n/10, count);
    }
    return 0;
}

int isArmstrong(int n)
{
    int temp = n;
    int count = 0;
    while (temp!=0) 
    {
        temp = temp/10;
        count++;
    }
    if (n==isArmstrongRecur(n,count)) return 1;
    else return 0; 
}


int isPalindromeRecur(int n, int rn) 
{
    
   if(n!=0){
      rn=rn*10+n%10;
      return isPalindromeRecur(n/10, rn);
   }
   return rn;

}

int isPalindrome(int n)
{

    if (n==isPalindromeRecur(n, 0)) return 1;
    else return 0;
}

#endif