with remote_job_skills as 
(
   SELECT skill_id, count(*) as skill_count 
   from skills_job_dim sjd 
   inner JOIN job_postings_fact jpf ON jpf.job_id = sjd.job_id 
   where jpf.job_work_from_home = TRUE 
   GROUP BY skill_id
)

SELECT sd.skill_id , sd.skills as skill_name, skill_count 
from  remote_job_skills
INNER JOIN skills_dim as sd on sd.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5 ;


--okay now it's time for a different approach !

select  count(sd.skill_id) as count, jpf.job_title_short, sd.skills

from skills_dim sd 

   INNER JOIN skills_job_dim sjd on sd.skill_id = sjd.skill_id
   INNER JOIN job_postings_fact jpf on jpf.job_id = sjd.job_id

   where jpf.job_work_from_home  = TRUE

   GROUP BY  sd.skills, jpf.job_title_short
   ORDER BY count DESC
   LIMIT 5

  ;


