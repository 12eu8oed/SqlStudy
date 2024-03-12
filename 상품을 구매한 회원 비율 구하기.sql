with allJoinUser as (
    select count(*) allJoinUser from USER_INFO ui
    where ui.JOINED like "2021%"
)
select year(sales_date) YEAR
    , month(sales_date) MONTH
    , count(DISTINCT os.user_id) PUCHASED_USERS
    , ROUND(count(DISTINCT os.user_id) / allJoinUser , 1) PUCHASED_RATIO
from
     allJoinUser
    , (select * from USER_INFO ui
       where ui.JOINED like "2021%") ui 
join ONLINE_SALE os on ui.user_id = os.user_id 
group by MONTH
order by YEAR, MONTH