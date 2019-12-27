fn main() {}

pub fn remove_char(s: &str) -> String {
    s[1..s.len() - 1].into()
}

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(remove_char("eloquent"), "loquen");
        assert_eq!(remove_char("country"), "ountr");
        assert_eq!(remove_char("person"), "erso");
        assert_eq!(remove_char("place"), "lac");
        assert_eq!(remove_char("ok"), "");
        assert_eq!(remove_char("ooopsss"), "oopss");
    }
}
