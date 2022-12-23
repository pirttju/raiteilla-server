use serde::{Deserialize, Serialize};

#[derive(Deserialize, sqlx::FromRow)]
pub struct Train {
    pub train_id: u32,
    pub departure_date: String,
    pub train_number: u32,
    pub im_code: u16,
}
