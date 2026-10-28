 SELECT sd.skills, count( sd.skill_id) as count
 from skills_job_dim sjd
 
left join skills_dim sd on sjd.skill_id = sd.skill_id
 
where sd.skill_id in (  
    
    SELECT skill_id
    from skills_job_dim  
    limit 5
)
group by sd.skills

order by sd.skills desc
LIMIT 5 
