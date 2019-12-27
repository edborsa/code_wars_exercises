fn main() {
    println!("Foo: {}", special_number(123456789));
}

fn special_number(n: u64) -> String {
    let str_answer: String = n
        .to_string()
        .chars()
        .filter(|x| x < &'0' || x > &'5')
        .map(|x| x.to_string())
        .collect();
    match str_answer.len() {
        0 => String::from("Special!!"),
        _ => String::from("NOT!!"),
    }
}

// fn special_number(n: u64) -> String {
//     if n.to_string().chars().any(|x| x.to_digit(10).unwrap() > 5) {
//         String::from("NOT!!")
//     } else {
//         String::from("Special!!")
//     }
// }
//
// fn special_number(n: u64) -> String {
//     let specialNumbers = "012345";
//     if n.to_string().chars().all(|x| specialNumbers.contains(x)) {
//         "Special!!".to_string()
//     } else {
//         "NOT!!".to_string()
//     }
// }

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(special_number(2), "Special!!");
        assert_eq!(special_number(3), "Special!!");
        assert_eq!(special_number(6), "NOT!!");
        assert_eq!(special_number(9), "NOT!!");
        assert_eq!(special_number(11), "Special!!");
        assert_eq!(special_number(55), "Special!!");
        assert_eq!(special_number(26), "NOT!!");
        assert_eq!(special_number(92), "NOT!!");
        assert_eq!(special_number(25432), "Special!!");
        assert_eq!(special_number(2783), "NOT!!");
    }
}
