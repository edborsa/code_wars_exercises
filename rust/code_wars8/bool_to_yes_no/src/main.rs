fn main() {}

fn bool_to_word(value: bool) -> &'static str {
    match value {
        true => "Yes",
        _ => "No",
    }
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(bool_to_word(true), "Yes");
        assert_eq!(bool_to_word(false), "No");
    }
}
