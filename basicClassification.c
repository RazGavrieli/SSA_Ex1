#include <stdio.h>
#include <math.h>

#ifndef NumClass
#define NumClass


int isPrime(int n)
{
    if (n==0) return 0;
    if (n==1) return 1;
    int sn = sqrt((double)(n));
    for (int i = 2; i <= sn; i++)
    {
        if (n%i==0) return 0;
    }
    return 1; 
}

int isStrong(int n)
{
    int temp = n;
    int sum = 0;
    int fact = 1;
    while (temp!=0)
    {
        for (int i = 1; i <=temp%10; i++)
        {
            fact*=i;
        }
        sum += fact; 
        temp = temp/10;
        fact = 1;
    }
        if (sum==n) return 1;
        else return 0;
}


#endif