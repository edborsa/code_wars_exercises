use regex::Regex;
fn main() {

    let re = Regex::new(r"^<*|>*$").unwrap();
    let hallway = "<<---->---<---<-->".replace("-", "");
    let after = re.replace_all(&hallway, "");
    // for char1 in after.chars() {
    //     let mut current char1;
    //     for 
    // }
    // println!("{:?}", after);
}

fn count_salutes(hallway: &str) -> usize {
    let mut greetings = 0;
    let mut right_arrows = 0;
    for c in hallway.chars() {
        match c {
            '>' => right_arrows += 1,
            '<' => greetings += right_arrows * 2,
             _  => (),
        }
    }
    greetings
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(count_salutes("<---->---<---<-->"), 4);
        assert_eq!(count_salutes("------"), 0);
        assert_eq!(count_salutes(">>>>>>>>>>>>>>>>>>>>>----<->"), 42);
        assert_eq!(count_salutes("<<----<>---<"), 2);
        assert_eq!(count_salutes(">"), 0);
    }
}
