use `Cinema`;

insert into film (title, DURATION) values ('Film 1',60);
insert into film (title, DURATION) values ('Film 2',90);
insert into film (title, DURATION) values ('Film 3',120);
insert into film (title, DURATION) values ('Film 4',60);
insert into film (title, DURATION) values ('Film 5',90);

insert into session_start_time (film_id, start_time) values (1,'22:00:00');
insert into session_start_time (film_id, start_time) values (2,'19:00:00');
insert into session_start_time (film_id, start_time) values (3,'14:00:00');
insert into session_start_time (film_id, start_time) values (4,'11:00:00');
insert into session_start_time (film_id, start_time) values (5,'10:00:00');
insert into session_start_time (film_id, start_time) values (1,'10:00:00');

insert into price_film (session_start_time_id, price) values (1,150.00);
insert into price_film (session_start_time_id, price) values (2,220.00);
insert into price_film (session_start_time_id, price) values (3,100.00);
insert into price_film (session_start_time_id, price) values (4,500.00);
insert into price_film (session_start_time_id, price) values (5,210.00);
insert into price_film (session_start_time_id, price) values (1,400.00);

insert into tickets (start_time_id) values (1);
insert into tickets (start_time_id) values (2);
insert into tickets (start_time_id) values (3);
insert into tickets (start_time_id) values (4);
insert into tickets (start_time_id) values (5);
insert into tickets (start_time_id) values (5);
insert into tickets (start_time_id) values (1);