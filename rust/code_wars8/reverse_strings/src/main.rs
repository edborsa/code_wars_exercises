fn main() {}

fn solution(phrase: &str) -> String {
    phrase.chars().rev().collect::<String>()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(solution("world"), "dlrow");
    }
}
