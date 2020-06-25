use std::env;

fn main() {
    if let Some(url) = env::args().collect::<Vec<String>>().iter().nth(1) {
        let url = url.to_owned();
        let full_url = url.clone();

        if url.starts_with("http") {
            let anchor = url.split('/').nth(2).unwrap_or("");
            if anchor.matches('.').count() > 1 {
                let anchor = anchor.split('.').nth(1).unwrap_or("");
                println!("[{}]({})", anchor, full_url)
            } else if anchor.matches('.').count() == 1 {
                let anchor = anchor.split('.').nth(0).unwrap_or("");
                println!("[{}]({})", anchor, full_url)
            } else {
                println!("[{}]({})", anchor, full_url)
            }
        } else {
            eprintln!("Not a valid http address")
        }
    }
}
