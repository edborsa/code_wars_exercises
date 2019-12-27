fn main() {
    let foo = "ABC"
        .chars()
        .map(|c| c as i8)
        .collect::<Vec<i8>>()
        .iter()
        .map(|i| i.to_string())
        .collect::<Vec<String>>()
        .join("");
    println!("{:?}", foo);
}

fn calc(s: &str) -> u32 {
    let int_built = s
        .chars()
        .map(|c| c as i8)
        .collect::<Vec<i8>>()
        .iter()
        .map(|i| i.to_string())
        .collect::<Vec<String>>()
        .join("");

    let changed_int = int_built
        .chars()
        .map(|x| {
            if x == '7' {
                "1".to_owned()
            } else {
                x.to_string()
            }
        })
        .collect::<Vec<String>>()
        .join("");

    let total1: u32 = int_built
        .chars()
        .map(|c| c as u32)
        .collect::<Vec<u32>>()
        .iter()
        .sum();
    let total2: u32 = changed_int
        .chars()
        .map(|c| c as u32)
        .collect::<Vec<u32>>()
        .iter()
        .sum();

    total1 - total2
}

// fn calc(s: &str) -> u32 {
//     let total1 = s
//         .chars()
//         .map(|c| format!("{}", c as u8))
//         .collect::<String>();
//     let total2 = total1.replace("7", "1");
//     let total1_sum = total1.chars().map(|c| c.to_digit(10).unwrap()).sum::<u32>();
//     let total2_sum = total2.chars().map(|c| c.to_digit(10).unwrap()).sum::<u32>();
//     total1_sum - total2_sum
// }

mod tests {
    use super::*;
    #[test]
    fn example_tests() {
        do_test("ABC", 6);
        do_test("abcdef", 6);
        do_test("ifkhchlhfd", 6);
        do_test("aaaaaddddr", 30);
        do_test("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", 96);
    }

    fn do_test(input: &str, expected: u32) {
        let user_result = calc(input);
        assert!(
            user_result == expected,
            "Test Failed!\ncalc(\"{}\") was {}\nExpected {}",
            input,
            user_result,
            expected
        );
    }
}
