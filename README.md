# テーブル設計

## usersテーブル
| Column     | type   | options  |
| ---------- | ------ | -------- |
| email      | string | NOT NULL |
| password   | string | NOT NULL |
| name       | string | NOT NULL |
| profile    | text   | NOT NULL |
| occupation | text   | NOT NULL |
| position   | text   | NOT NULL |

### Association      
- has_many prototypes
- has_many comments


## commentsテーブル
| Column    | type       | options  |
| --------- | ---------- | -------- |
| text      | text       | NOT NULL |
| user      | references |          |
| prototype | references |          |

### Association
- belong_to user
- belong_to prototype


## prototypeテーブル
| Column     | type       | options  |
| ---------- | ---------- | -------- |
| title      | string     | NOT NULL |
| catch_copy | text       | NOT NULL |
| concept    | text       | NOT NULL |
| image      |            |          |
| user       | references |          |

### Association
- belong_to user
- has_many prototypes