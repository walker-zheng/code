extern crate rand;

use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("guess the num!");
    let secret_num = rand::thread_rng().gen_range(1, 101);
    //  println!("secret num is: {}", secret_num);
    loop {
        println!("Input your guess: ");
        let mut guess = String::new();
        io::stdin().read_line(&mut guess)
            .expect("failed to read line");
        let  guess: u32 = match guess.trim().parse(){
            Ok(num)     => num,
            Err(_)          => {
                println!("Not a num, try again");
                continue
            }
        };
        println!("you guessed: {}", guess);
        match guess.cmp(&secret_num){
            Ordering::Less          => println!("Too small"),
            Ordering::Greater          => println!("Too big"),
            Ordering::Equal          => {
                println!("You win!");
                break
            }
        }
    }
}
