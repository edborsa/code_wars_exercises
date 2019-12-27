fn main() {}

fn get_age(age: &str) -> u32 {
    age.split(' ').collect::<Vec<&str>>()[0]
        .parse::<u32>()
        .unwrap()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(get_age("2 years old"), 2);
        assert_eq!(get_age("4 years old"), 4);
        assert_eq!(get_age("5 years old"), 5);
        assert_eq!(get_age("7 years old"), 7);
    }
}
