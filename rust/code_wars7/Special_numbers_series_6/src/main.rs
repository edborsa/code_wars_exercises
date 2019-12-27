fn main() {
    let s = String::from("hello world");

    let last_two: String = s
        .chars()
        .rev()
        .take(2)
        .map(|x| x.to_string())
        .collect::<String>()
        .chars()
        .rev()
        .map(|x| x.to_string())
        .collect();

    println!("{:?}", last_two);
}

fn automorphic(n: u64) -> String {
    let len_num = n.to_string().len();
    let mut squared = (n * n).to_string();
    match squared
        .chars()
        .rev()
        .take(len_num)
        .map(|x| x.to_string())
        .collect::<String>()
        .chars()
        .rev()
        .map(|x| x.to_string())
        .collect::<String>()
        .eq(&n.to_string())
    {
        true => String::from("Automorphic"),
        _ => String::from("Not!!"),
    }
}
// fn automorphic(n: u64) -> String {
//     if n.pow(2).to_string().ends_with(&n.to_string()) {
//         String::from("Automorphic")
//     } else {
//         String::from("Not!!")
//     }
// }

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(automorphic(1), "Automorphic");
        assert_eq!(automorphic(3), "Not!!");
        assert_eq!(automorphic(6), "Automorphic");
        assert_eq!(automorphic(9), "Not!!");
        assert_eq!(automorphic(25), "Automorphic");
        assert_eq!(automorphic(53), "Not!!");
        assert_eq!(automorphic(76), "Automorphic");
        assert_eq!(automorphic(95), "Not!!");
        assert_eq!(automorphic(625), "Automorphic");
        assert_eq!(automorphic(225), "Not!!");
    }
}
