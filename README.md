# Schema

- 一(user)對多(task)

- User

attr_name | attr_type | default | index | desc 
----------|:---------:|--------:|------:|-------
id        | integer   |         |       |會員編號
user_name | string    |         |       | 名稱
password  | string    |         |       | 密碼
is_admin  | boolean   |  false  |       | 是否為管理員



- Task

attr_name | attr_type | default | index | desc 
----------|:---------:|--------:|------:|-------
id        | integer   |         |       | 任務編號
user_id   |   integer |         |       | 使用者編號
title     | string    |         |  true | 標題
description|text      |         |  true | 內容
end_time  |datetime   |         |  true | 結束時間
status    |integer(enum) |      |  true | 狀態
priority  | integer(enum)|      |  true | 優先順序   


