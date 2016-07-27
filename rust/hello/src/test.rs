fn hello()
{
    let mut x = vec!["hello", "world"];
    println!(x);
    let y = x[0].clone();
    {
        let y = x[0].clone();
        println!(y);
    }
    println!(y);
    x.push("foo");
    println!(x);
}
