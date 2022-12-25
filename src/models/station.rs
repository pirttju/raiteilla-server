use serde::{Deserialize, Serialize};

#[derive(Deserialize, sqlx::FromRow)]
pub struct Station {
    pub station_id: u32,
    pub short_code: String,
    pub source_id: u16,
    pub name: String,
}
