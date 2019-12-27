fn main() {}

fn century(year: u32) -> u32 {
    let mut response = 1;
    let mut year = year;
    while year > 100 {
        year -= 100;
        response += 1;
    }
    response
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(century(1705), 18);
        assert_eq!(century(1900), 19);
        assert_eq!(century(1601), 17);
        assert_eq!(century(2000), 20);
        assert_eq!(century(89), 1);
    }
}
