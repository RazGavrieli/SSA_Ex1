#include <stdio.h>
#include <math.h>

#ifndef NumClass
#define NumClass

int isArmstrong(int n)
{
    int temp = n;
    int count = 0;
    int sum = 0;
    while (temp!=0) 
    {
        temp = temp/10;
        count++;
    }
    temp = n;
    while (temp!=0)
    {
        sum = sum+pow(temp%10, count);
        temp = temp/10;
    }
    if (sum==n) return 1;
    else return 0;    
}

int isPalindrome(int n)
{
    int temp = n; 
    int palindrome=0;
    while (temp!=0)
    {
        palindrome=palindrome*10+temp%10;
        temp=temp/10;
    }
    if (n==palindrome) return 1;
    else return 0;
}

#endif