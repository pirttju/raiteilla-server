use serde::{Deserialize, Serialize};

#[derive(Deserialize, sqlx::FromRow)]
pub struct Station {
    pub station_id: u32,
    pub short_code: String,
    pub im_code: u16,
    pub name: String,
}
