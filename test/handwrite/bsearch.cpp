//数组递增有序
int binarySearch(int *array, int len, int value)
{
    int mid = 0;
    int low = 0;
    int high = len - 1;
    while (low <= high)
    {
        mid = (low + high) / 2;
        if (array[mid] == value) //找到
            return mid;
        if (value > array[mid]) //在右半区
            low = mid + 1;
        else //在左半区
            high = mid - 1;
    }
    return -1; //查找失败
}
int getSecondMax(int array[], int len)
{
    if (len <= 1)
        return -1;
    int max = 0, secondMax = 0;
    if (array[0] > array[1])
    {
        max = array[0];
        secondMax = array[1];
    }
    else
    {
        max = array[1];
        secondMax = array[0];
    }
    for (int i = 2; i != len; i++)
    {
        if (array[i] < secondMax)
            continue;
        if (array[i] < max && array[i] > secondMax) //新的第二大数
            secondMax = array[i];
        else
            max = array[i]; //最大数
    }
    return secondMax;
}
