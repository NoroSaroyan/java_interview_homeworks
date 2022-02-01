use `Cinema`;

select film.title                    'Film 1',
       session_start_time.start_time 'Starting time ',
       film.duration                 'Duration',
       film2.title                   'Film 2',
       film2.start_time              'Starting time',
       film2.duration                'Duration'
from session_start_time
         join film on session_start_time.film_id = film.id
         join (select film.title,
                      session_start_time.film_id,
                      session_start_time.start_time,
                      film.duration,
                      session_start_time.start_time + INTERVAL film.duration MINUTE as end_time
               from session_start_time
                        join film on session_start_time.film_id = film.id) as film2
              on (session_start_time.start_time + INTERVAL film.duration MINUTE >
                  film2.start_time)
                  and (session_start_time.start_time + INTERVAL film.duration MINUTE < film2.end_time)
                  and session_start_time.film_id != film2.film_id
order by session_start_time.start_time;

select film_1.title                    'Film 1',
       session_start_time_1.start_time 'Starting time',
       film_1.duration                 'Duration',
       session_start_time.start_time   "Second films' starting time",
       timestampdiff(minute, session_start_time_1.start_time, session_start_time.start_time) -
       film_1.duration as              'Break duration'
from session_start_time
         join film on session_start_time.film_id = film.id
         left join session_start_time session_start_time_1 on session_start_time_1.id = session_start_time.id - 1
         left join film film_1 on film_1.id = session_start_time_1.film_id
where timestampdiff(minute, session_start_time_1.start_time, session_start_time.start_time) - film.duration >= 30
order by session_start_time_1.start_time desc;

(select film.title                                                       as 'films',
        count(distinct tickets.id)                                       as 'viewers',
        sum(price_film.price)                                            as 'price',
        AVG(distinct tickets.id) / count(distinct tickets.start_time_id) as 'average viewers'
 from tickets
          join session_start_time on tickets.start_time_id = session_start_time.id and
                                     price_film.session_start_time_id = session_start_time.id
          join film on session_start_time.film_id = film.id

 group by film.title
 order by 'price' desc
)
union
select 'Total:',
       count(*),
       sum(price_film.pric),
       count(*) / count(distinct tickets.start_time_id)
from tickets
         join session_start_time on tickets.start_time_id = session_start_time.id;