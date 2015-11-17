#include <iostream>

#define DBG(level, format, ...) do {      \
  if (level <= DBGLEVEL) {          \
    LOG(LOG_DEBUG, format, ## __VA_ARGS__); \
  }                      \
} while(0)



//Data swop function
void Swap(int &p,int &q)
{
    int temp = p;
    p=q;
    q=temp;
}

//Partition function
int Partition(int ArrayInput[],int nLow,int nHigh)
{

    int nTemp=ArrayInput[nHigh];
    int i = nLow, j=nLow-1;
    for(; i<nHigh; i++)
    {
        if( ArrayInput[i]<=nTemp )
        {
            j++;
            if(i !=j )
            {
                Swap(ArrayInput[i], ArrayInput[j]);
            }
        }
    }

    Swap(ArrayInput[j+1],ArrayInput[nHigh]);

    return (j+1);
}

//Quick sort
void Quick_sort(int ArrayInput[],int nLow,int nHigh)
{
    if(nLow < nHigh)
    {
        int nIndex=Partition(ArrayInput , nLow, nHigh);
        Quick_sort(ArrayInput , nLow, nIndex-1);
        Quick_sort(ArrayInput , nIndex+1, nHigh);
    }
}

int main()
{
    int array[] = {2,8,7,1,3,5,6,4};
    int count = sizeof(array)/sizeof(int);

    for(int i = 0; i < count; i++)
    {
        std::cout << array[i] << "\t";
    }
    std::cout << std::endl;

		Quick_sort(array, 0, count - 1);
		

    for(int i = 0; i < count; i++)
    {
        std::cout << array[i] << "\t";
    }
    std::cout << std::endl;

    return 0;
}