select (0) as "1_1",(t1865."2") as "1_2",(t1860."dpt") as "2_department",(5) as "2_people_1",(row_number() over (order by t1865."2",t1860."dpt")) as "2_people_2" from (select (1) as "2") as t1865,departments as t1860;