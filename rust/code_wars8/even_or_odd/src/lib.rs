fn even_or_odd(i: i32) -> &'static str {
    match i % 2 {
        0 => "Even",
        _ => "Odd",
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    #[test]

    fn it_works() {
        assert_eq!(even_or_odd(0), "Even");
        assert_eq!(even_or_odd(2), "Even");
        assert_eq!(even_or_odd(1), "Odd");
        assert_eq!(even_or_odd(7), "Odd");
        assert_eq!(even_or_odd(-1), "Odd");
    }
}
