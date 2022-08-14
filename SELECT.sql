--1
select t.name, count(ctp.performer_id) per_count from title t
join con_titles_per ctp on t.title_id = ctp.title_id
group by t.name
order by per_count desc;

--2
select a.year_of_release, count(t.track_id) from album a 
left join track t on a.album_id = t.album_id 
where a.year_of_release = 2019 or a.year_of_release = 2020
group by a.year_of_release;

--3
select  a.name, avg(t.duration) t_dur from album a 
left join track t on a.album_id = t.album_id
group by a.name
order by t_dur desc;

--4
select p.name from performer p 
join con_per_albums cpa  on p.performer_id = cpa.performer_id
join album a on cpa.album_id = a.album_id
where a.year_of_release != 2020
group by p.name;

--5
select c.name, p.name from collection c 
join con_tracks_col ctc on c.collection_id = ctc.collection_id 
join track t on ctc.track_id = t.track_id
join album a on t.album_id = a.album_id
join con_per_albums cpa on a.album_id = cpa.album_id 
join performer p on cpa.performer_id = p.performer_id 
where p.name = 'Макс Корж'
group by c.name, p.name;

--6
select a.name from title t 
join con_titles_per ctp on t.title_id = ctp.title_id
join performer p on ctp.performer_id = p.performer_id 
join con_per_albums cpa on p.performer_id = cpa.performer_id
join album a on cpa.album_id = a.album_id
group by a.name
having count(ctp.performer_id) > 1;

--7
select t.name from track t 
full outer join con_tracks_col ctc on t.track_id = ctc.track_id 
full outer join collection c on ctc.collection_id = c.collection_id
group by t.name
having count(ctc.collection_id) = 0;

--8 
select p.name, t.duration from performer p 
full outer join con_per_albums cpa  on p.performer_id = cpa.performer_id
full outer join album a on cpa.album_id = a.album_id
left join track t on t.album_id = a.album_id 
where t.duration in (select min(duration) from track);

--9 
select a.name, count(t.track_id) from album a 
join track t on a.album_id = t.album_id
group by a.name 
having count(t.track_id) in (select count(t.track_id) from album a
        join track t  on a.album_id = t.album_id
        group by a.name
        order by count(t.track_id)
        limit 1)
 



