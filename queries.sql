create table posts
(
    id serial primary key,
    title text not null,
    body text default '...',
    creator_id int references users(id) not null
);

insert into posts
    (title, creator_id)
values
    ('great fi2t post', 3);

select *
from posts;

delete from users where id = 1;

drop table posts;

select u.id user_id, p.id post_id, first_name, title
from users u inner join posts p on u.id = p.creator_id
where p.title like '%post';

create table comments
(
    id serial primary key,
    message text not null,
    post_id int references posts(id),
    creator_id int references users(id)
);

insert
	into
	comments
    (message, post_id, creator_id)
values
    ('skrt skrt', 3, 2);

select
    c.message,
    p.title,
    u.id first_name_for_post,
    u2.id first_name_for_comment
from
    comments c
    inner join posts p on
	c.post_id = p.id
    inner join users u on
	p.creator_id = u.id
    inner join users u2 on
	c.creator_id = u2.id;

create table favorites
(
    user_id int references users(id),
    post_id int references posts(id),
    primary key (user_id, post_id)
);

insert into favorites
    (user_id, post_id)
values
    (1, 3);

select *
from favorites;

create table friends
(
    user_id1 int references users(id),
    user_id2 int references users(id),
    primary key (user_id1, user_id2)
);

insert into friends
    (user_id1, user_id2)
values
    (1, 2);

select *
from friends
where user_id1 = 2;





	

