select sum(case when trim(AE."event_name")='open_activity' then 1 else 0 end) as OpenAct_count, 
sum(case when trim(AE."event_name")='open_activity' then 1 else 0 end)/count(distinct F."userkey") as user_avg, 
F."country" as country from 
 "User"."Fact_UserActivity" F
left join "User"."User" U on F."userkey"=U."Id"
left join "User"."AppEvents" AE on AE."user_id"=U."Id"
 where U."created_at"+ interval '7' day  >= to_timestamp(cast(AE."event_at" as bigint))
group by F."country" 