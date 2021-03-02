# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique:true       |
| encrypted_password | string     | null: false                    |
| prefecture_code    | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     | null: false                    |
| phone_number       | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_day          | date       | null: false                    |
### Association

- has_many :jobs
- has_many :messages
- has_many :likes, dependent: :destroy
- has_many :like_jobs, through: :likes, source: :job
- has_many :applicant_jobs, through: :applicants, source: :job

## companies テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| encrypted_password       | string     | null: false                    |
| email                    | string     | null: false, unique:true       |
| business_content_id      | integer    | null: false                    |
| company_name             | string     | null: false                    |
| representative_name      | string     | null: false                    |
| representative_name_kana | string     | null: false                    |
| foundation_date          | date       | null: false                    |
| employee_number          | string     | null: false                    |
| prefecture_code          | string     | null: false                    |
| prefectures_id           | integer    | null: false                    |
| city                     | string     | null: false                    |
| address                  | string     | null: false                    |
| building_name            | string     | null: false                    |
| phone_number             | string     | null: false                    |

### Association

- has_many :jobs

## jobs テーブル

| Column                   | Type       | Options                        |
| -----------------------  | ---------- | ------------------------------ |
| recruitment_type_id      | integer    | null: false                    |
| job_description          | text       | null: false                    |
| qualification            | text       | null: false                    |
| prefectures_id           | integer    | null: false                    |
| workplace                | string     | null: false                    |
| salary                   | string     | null: false                    |
| bonus                    | string     | null: false                    |
| employment_status_id     | integer    | null: false                    |
| working_hours            | string     | null: false                    |
| holiday_id               | integer    | null: false                    |
| experience＿id           | integer    | null: false                    |
| educational_background_id| integer    | null: false                    |
| age_requirements_id      | integer    | null: false                    |
| company                  | references | null: false, foreign_key: true |
| like                     | references | null: false, foreign_key: true |

### Association

- belongs_to :companies
- belongs_to :user
- has_many :messages
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes
- has_many :users, through: :applicants

## messages テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| job        | references | null: false, foreign_key: true |

### Association

- belongs_to :job
- belongs_to :user

## likes テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| job        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job

## applicants テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| job        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :job