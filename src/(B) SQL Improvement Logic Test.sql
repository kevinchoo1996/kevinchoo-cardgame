WITH Top50Jobs AS (
    SELECT Jobs.id
    FROM jobs Jobs
    WHERE ((
	Jobs.name LIKE '%キャビンアテンダント%'
	OR Jobs.description LIKE '%キャビンアテンダント%'
	OR Jobs.detail LIKE '%キャビンアテンダント%'
	OR Jobs.business_skill LIKE '%キャビンアテンダント%'
	OR Jobs.knowledge LIKE '%キャビンアテンダント%'
	OR Jobs.location LIKE '%キャビンアテンダント%'
	OR Jobs.activity LIKE '%キャビンアテンダント%'
	OR Jobs.salary_statistic_group LIKE '%キャビンアテンダント%'
	OR Jobs.salary_range_remarks LIKE '%キャビンアテンダント%'
	OR Jobs.restriction LIKE '%キャビンアテンダント%'
	OR Jobs.remarks LIKE '%キャビンアテンダント%'
    OR EXISTS (
	  SELECT 1
	  FROM job_categories jc
	  WHERE jc.id = Jobs.job_category_id
		AND jc.deleted IS NULL
		AND jc.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
	  SELECT 1
	  FROM job_types jt
	  WHERE jt.id = Jobs.job_type_id
		AND jt.deleted IS NULL
		AND jt.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
			SELECT 1
			FROM jobs_personalities jp
			INNER JOIN personalities p
				ON p.id = jp.personality_id
				AND p.deleted IS NULL
			WHERE jp.job_id = Jobs.id
			  AND p.name LIKE '%キャビンアテンダント%'
		)
	OR EXISTS (
			SELECT 1
			FROM jobs_practical_skills jps
			INNER JOIN practical_skills ps
				ON ps.id = jps.practical_skill_id
				AND ps.deleted IS NULL
			WHERE jps.job_id = Jobs.id
			  AND ps.name LIKE '%キャビンアテンダント%'
		)
	OR EXISTS (
		SELECT 1
		FROM jobs_basic_abilities jba
		INNER JOIN basic_abilities ba
			ON ba.id = jba.basic_ability_id
			AND ba.deleted IS NULL
		WHERE jba.job_id = Jobs.id
		  AND ba.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
		SELECT 1
		FROM jobs_tools jt
		INNER JOIN affiliates t
			ON t.id = jt.affiliate_id
			AND t.type = 1
			AND t.deleted IS NULL
		WHERE jt.job_id = Jobs.id
		  AND t.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
		SELECT 1
		FROM jobs_career_paths jcp
		INNER JOIN affiliates cp
			ON cp.id = jcp.affiliate_id
			AND cp.type = 3
			AND cp.deleted IS NULL
		WHERE jcp.job_id = Jobs.id
		  AND cp.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
		SELECT 1
		FROM jobs_rec_qualifications jrq
		INNER JOIN affiliates rq
			ON rq.id = jrq.affiliate_id
			AND rq.type = 2
			AND rq.deleted IS NULL
		WHERE jrq.job_id = Jobs.id
		  AND rq.name LIKE '%キャビンアテンダント%'
	)
	OR EXISTS (
		SELECT 1
		FROM jobs_req_qualifications jrq2
		INNER JOIN affiliates rq2
			ON rq2.id = jrq2.affiliate_id
			AND rq2.type = 2
			AND rq2.deleted IS NULL
		WHERE jrq2.job_id = Jobs.id
		  AND rq2.name LIKE '%キャビンアテンダント%'
	)
)
AND publish_status = 1
AND (Jobs.deleted) IS NULL)
 ORDER BY Jobs.sort_order DESC, Jobs.id DESC
    LIMIT 50
)
SELECT 
    Jobs.id AS `Jobs__id`,
	Jobs.name AS `Jobs__name`,
	Jobs.media_id AS `Jobs__media_id`,
	Jobs.job_category_id AS `Jobs__job_category_id`,
	Jobs.job_type_id AS `Jobs__job_type_id`,
	Jobs.description AS `Jobs__description`,
	Jobs.detail AS `Jobs__detail`,
	Jobs.business_skill AS `Jobs__business_skill`,
	Jobs.knowledge AS `Jobs__knowledge`,
	Jobs.location AS `Jobs__location`,
	Jobs.activity AS `Jobs__activity`,
	Jobs.academic_degree_doctor AS `Jobs__academic_degree_doctor`,
	Jobs.academic_degree_master AS `Jobs__academic_degree_master`,
	Jobs.academic_degree_professional AS `Jobs__academic_degree_professional`,
	Jobs.academic_degree_bachelor AS `Jobs__academic_degree_bachelor`,
	Jobs.salary_statistic_group AS `Jobs__salary_statistic_group`,
	Jobs.salary_range_first_year AS `Jobs__salary_range_first_year`,
	Jobs.salary_range_average AS `Jobs__salary_range_average`,
	Jobs.salary_range_remarks AS `Jobs__salary_range_remarks`,
	Jobs.restriction AS `Jobs__restriction`,
	Jobs.estimated_total_workers AS `Jobs__estimated_total_workers`,
	Jobs.remarks AS `Jobs__remarks`,
    Jobs.url AS `Jobs__url`,
	Jobs.seo_description AS `Jobs__seo_description`,
	Jobs.seo_keywords AS `Jobs__seo_keywords`,
	Jobs.sort_order AS `Jobs__sort_order`,
	Jobs.publish_status AS `Jobs__publish_status`,
	Jobs.version AS `Jobs__version`,
	Jobs.created_by AS `Jobs__created_by`,
	Jobs.created AS `Jobs__created`,
	Jobs.modified AS `Jobs__modified`,
	Jobs.deleted AS `Jobs__deleted`,
	JobCategories.id AS `JobCategories__id`,
	JobCategories.name AS `JobCategories__name`,
	JobCategories.sort_order AS `JobCategories__sort_order`,
	JobCategories.created_by AS `JobCategories__created_by`,
	JobCategories.created AS `JobCategories__created`,
	JobCategories.modified AS `JobCategories__modified`,
	JobCategories.deleted AS `JobCategories__deleted`,
	JobTypes.id AS `JobTypes__id`,
	JobTypes.name AS `JobTypes__name`,
	JobTypes.job_category_id AS `JobTypes__job_category_id`,
	JobTypes.sort_order AS `JobTypes__sort_order`,
	JobTypes.created_by AS `JobTypes__created_by`,
	JobTypes.created AS `JobTypes__created`,
	JobTypes.modified AS `JobTypes__modified`,
	JobTypes.deleted AS `JobTypes__deleted`
	FROM Top50Jobs fj
	INNER JOIN jobs Jobs
		ON Jobs.id = fj.id
	INNER JOIN job_categories JobCategories
		ON JobCategories.id = Jobs.job_category_id
		AND JobCategories.deleted IS NULL
	INNER JOIN job_types JobTypes
		ON JobTypes.id = Jobs.job_type_id
		AND JobTypes.deleted IS NULL
	ORDER BY Jobs.sort_order DESC, Jobs.id DESC;
