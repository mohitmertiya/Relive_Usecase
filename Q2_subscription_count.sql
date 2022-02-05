select DT."week",count(distinct U."Id") as subscription_count from "User"."User" U
left join "User"."AppEvents" AE on U."Id"=AE."user_id"
left join "User"."dim_time" DT on DT."date"=date(U."created_at")
where event_name='purchase_plus' 
and U."created_at"+ interval '7' day >= to_timestamp(cast(event_at as bigint))
group by DT."week"