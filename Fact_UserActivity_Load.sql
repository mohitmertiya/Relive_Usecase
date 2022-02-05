insert into "User"."Fact_UserActivity" (userkey,activitykey,timekey,
activitycount, country)
select U."Id" as userkey, A."id" as activitykey,DT."date" as timekey,count(A."id") as activitycount,
U."country"
From "User"."User" U 
Left join "User"."Activities" A on U."Id"=A."user_id"
Left join "User"."dim_time" DT on DT."date"=date(U."created_at")
group by U."Id" , A."id",DT."date",U."country"