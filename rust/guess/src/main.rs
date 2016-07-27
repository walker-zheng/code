use std::thread;
use std::sync::{Mutex,  Arc};
use std::time::Duration;

struct Philosopher {
    name: String,
    left: usize,
    right: usize,
}
impl Philosopher {
    fn new(name: &str, left: usize, right: usize) -> Philosopher{
        Philosopher{
            name: name.to_string(),
            left: left,
            right: right,
        }
    }
    fn eat(&self, table: &Table){
        let _left = table.forks[self.left].lock().unwrap();
        thread::sleep(Duration::from_millis(50));
        let _right = table.forks[self.right].lock().unwrap();
        println!("{} is eating...", self.name);
        thread::sleep(Duration::from_millis(2000));
        println!("{} is done eating.", self.name);
    }
}
struct Table {
    forks: Vec<Mutex<()>>,
}
fn main() {
    let table = Arc::new(Table{ forks: vec![
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        Mutex::new(()),
        ]});
    let vec_p = vec![
        Philosopher::new("朱迪斯·巴特勒", 0, 1),
        Philosopher::new("吉尔·德勒兹", 1, 2),
        Philosopher::new("卡尔·马克思", 2, 3),
        Philosopher::new("爱玛·戈德曼", 3, 4),
        Philosopher::new("米歇尔·福柯", 4, 5),
        Philosopher::new("朱迪斯·巴特勒1", 5, 6),
        Philosopher::new("吉尔·德勒兹1", 6, 7),
        Philosopher::new("卡尔·马克思1", 7, 8),
        Philosopher::new("爱玛·戈德曼1", 8, 9),
        Philosopher::new("米歇尔·福柯1", 0, 9),
    ];
    let handles: Vec<_> = vec_p.into_iter().map(|p|{
        let table = table.clone();
        thread::spawn(move||{
            p.eat(&table);
        })
    }).collect();
    for h in handles{
        h.join().unwrap();
    }
}
