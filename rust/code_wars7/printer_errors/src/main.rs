use regex::Regex;
fn main() {}

fn printer_error(s: &str) -> String {
    let re = Regex::new(r"[a-m]").unwrap();
    format!("{}/{}", s.len() - re.find_iter(s).count(), s.len())
}

// fn printer_error(s: &str) -> String {
//     // Your cude here
//     format!("{}/{}", s.chars().filter(|&c| c > 'm').count(), s.len())
// }

mod tests {
    use super::*;
    #[test]
    fn test_hello() {
        assert_eq!(
            &printer_error("aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"),
            "3/56"
        );
        assert_eq!(
            &printer_error("kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"),
            "6/60"
        );
        assert_eq!(
            &printer_error("kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyzuuuuu"),
            "11/65"
        );
    }
}
