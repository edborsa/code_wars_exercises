fn main() {}

fn get_count(string: &str) -> usize {
    string.chars()
          .filter(|x| ['a', 'e', 'i', 'o', 'u'].contains(x))
          .count()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(get_count("abracadabra"), 5);
    }
}
