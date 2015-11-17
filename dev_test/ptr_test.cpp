int main(int argc, char *argv[])  
{  
    AutoPtr<int> intPtr1(new int(0));  
    time_t beg1 = clock();  
    for (int i = 0; i < 10000000; ++i)  
    {  
        AutoPtr<int> tmp = intPtr1;  
        ++(*tmp);  
    }  
    time_t end1 = clock();  
    std::cout << "AutoPtr cost: " << end1 - beg1 << ", Result: " << *intPtr1 << std::endl;  
  
    boost::shared_ptr<int> intPtr2(new int(0));  
    time_t beg2 = clock();  
    for (int i = 0; i < 10000000; ++i)  
    {  
         boost::shared_ptr<int> tmp = intPtr2;  
         ++(*tmp);  
    }  
    time_t end2 = clock();  
    std::cout << "boost::shared_ptr cost:" << end2 - beg2 << ", Result: " << *intPtr2 << std::endl;  
  
    std::tr1::shared_ptr<int> intPtr3(new int(0));  
    time_t beg3 = clock();  
    for (int i = 0; i < 10000000; ++i)  
    {  
        std::tr1::shared_ptr<int> tmp = intPtr3;  
         ++(*tmp);  
    }  
    time_t end3 = clock();  
    std::cout << "std::tr1::shared_ptr cost:" << end3 - beg3 << ", Result: " << *intPtr3 << std::endl;  
  
    return 0;  
}  