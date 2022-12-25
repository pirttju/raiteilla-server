use serde::{Deserialize, Serialize};

#[derive(Deserialize, sqlx::FromRow)]
pub struct Train {
    pub id: u32,
    pub departure: String,
    pub train: u32,
    pub source_id: u16,
    pub public_train: String,
    pub operator_id: u16,
    pub cancelled: Bool,
    pub created: String,
    pub regular: Bool,
}

#[derive(Deserialize, sqlx::FromRow)]
pub struct Timetable {
    pub id: u32,
    pub train_id: u32,
    pub station_id: u32,
    pub scheduled: String,
    pub is_departure: Bool,
    pub actual: String,
    pub is_estimate: Bool,
    pub reason_code: String,
}
