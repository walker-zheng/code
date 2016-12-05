import "fmt"
// 协程的实例

func sum(values []int, myChan chan int) {

    sum := 0
    for _, value := range values {
        sum += value
    }

     myChan <- sum //值传到通道
}

func main() {

    myChan := make( chan int,2)

    values := []int {1,2,3,5,5,4}
    go sum(values,myChan)  //协程1
    go sum(values[:3],myChan) //协程2

    sum1,sum2 := <-myChan, <-myChan
    fmt.Println("Result:",sum1,sum2,sum1+sum2)
}
