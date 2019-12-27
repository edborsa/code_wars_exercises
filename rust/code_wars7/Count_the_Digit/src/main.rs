fn main() {
    // .map(|x| {
    //     x.to_string()
    //         .chars()
    //         .into_iter()
    //         .filter(|&x| x == char::from_digit(7, 10).expect("fo"))
    //         .collect::<String>()
    //         .len()
    // });
    println!(
        "{:?}",
        (0..5)
            .collect::<Vec<i32>>()
            .into_iter()
            .map(|x| x * x)
            .collect::<Vec<i32>>()
            .into_iter()
            .map(|sqred| sqred
                .to_string()
                .chars()
                .map(|d| d.to_digit(10).unwrap())
                .collect::<Vec<_>>()
                .into_iter()
                .filter(|&d| d == 1)
                .collect::<Vec<_>>()
                .len())
            .collect::<Vec<_>>()
            .into_iter()
            .fold(0, |acc, x| acc + x)
    )
}

use std::fs::File
fn nb_dig(n: i32, d: i32) -> i32 {

    (0..=n)
        .collect::<Vec<i32>>()
        .into_iter()
        .map(|x| x * x)
        .collect::<Vec<i32>>()
        .into_iter()
        .map(|sqred| {
            sqred
                .to_string()
                .chars()
                .map(|d| d.to_digit(10).unwrap())
                .collect::<Vec<_>>()
                .into_iter()
                .filter(|&num| num == d as u32)
                .collect::<Vec<_>>()
                .len()
        })
        .collect::<Vec<_>>()
        .into_iter()
        .fold(0, |acc, x| acc + x as i32)
}

// fn nb_dig(n: i32, d: i32) -> i32 {
//     let ex = d.to_string();
//     (0..=n)
//         .map(|v| (v * v).to_string())
//         .fold(0, |acc, v| acc + v.matches(&ex).count() as i32)
// }

// fn nb_dig(n: i32, d: i32) -> i32 {
//     let mut ans = 0;
//     for i in 0..n+1 {
//         let square = (i*i).to_string();
//         for c in square.chars() {
//             if c.to_digit(10).unwrap() as i32 == d {
//                 ans += 1
//             }
//         }
//     }
//     ans
// }

// fn nb_dig(n: i32, d: i32) -> i32 {
//     (0..=n).fold(0, |r, x| r + (x * x).to_string().chars().filter(|c| c.to_digit(10).unwrap() as i32 == d).count() as i32)
// }

mod tests {
    use super::*;

    #[test]
    fn basic_tests() {
        dotest(5, 1, 2);
        dotest(550, 5, 213);
        dotest(5750, 0, 4700);
    }

    fn dotest(n: i32, d: i32, exp: i32) -> () {
        println!("n: {:?}", n);
        println!("d: {:?}", d);
        let ans = nb_dig(n, d);
        println!("actual:\n{:?}", ans);
        println!("expect:\n{:?}", exp);
        println!("{}", ans == exp);
        assert_eq!(ans, exp);
        println!("{}", "-");
    }
}
