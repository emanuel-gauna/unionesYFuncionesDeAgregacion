-- micro desafio 1 --

select title as "titulo de serie" , genre_id as "FK de genero" , genres.name as "nombre de genero" 
from series
inner join genres
on genre_id = genres.id;

select title as "titulo de episodios" , actors.first_name as "nombre de actor", actors.last_name as "apellido"
from episodes
inner join actor_episode
on  actor_episode.episode_id  = episodes.id
inner join actors
on actor_episode.actor_id =  actors.id ;

-- micro desafio 2 --

select actors.first_name  , actors.last_name , actors.id , movies.title 
from  actors
inner join actor_movie  
on actor_movie.actor_id = actors.id
inner join movies 
on actor_movie.movie_id = movies.id 
where title like "%la guerra de%" 
group by actors.id ;

select genre_id ,  title as "titulo de peli" ,  coalesce(genres.name, null  ,"no tiene genero")  as "genero"
from movies 
left join genres
on genre_id = genres.id;

select  title as "titulo serie" , release_date as "estreno", end_date as "finalizacion" ,  datediff(end_date, release_date) as "duracion"
from series ;

--  micro desafio paso 5 -- 

select first_name 
from actors
where length(first_name) > 6
order by first_name asc;

select count(id) 
from episodes;

select series.title  as "titulo serie" ,  count(*)
from series 
inner join seasons 
on series.id = seasons.serie_id
group by series.title ;

select  genre_id , count(*), genres.name  
from movies
inner join genres
on genre_id = genres.id 
group by genres.name
having count(*) >= 3 ;