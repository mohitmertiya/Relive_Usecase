SELECT count( distinct user_id)  as secondactivity_Count FROM "User"."AppEvents" AE1
where event_name='create_video' and exists 
(select user_id from "User"."AppEvents" AE2 
 where AE1.activity_id>AE2.activity_id and AE2.event_name='create_activity');
 