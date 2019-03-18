create table message_transactional
(
	profile_id varchar(256),
	template varchar(256),
	send_time timestamp,
	clicks varchar(max),
	opens varchar(max),
	device varchar(256),
	message_revenue int,
	delivery_status varchar(50),
	id varchar(256)
)distkey(send_time)
  sortkey(send_time);


  create table message_blast
(
	profile_id varchar(256),
	send_time timestamp,
  opens varchar(max),
	clicks varchar(max),
  blast_id int,
  message_id int,
  device varchar(256),
	message_revenue int,
	delivery_status varchar(50)
)distkey(send_time)
  sortkey(send_time);


  create table blast
(
	name varchar(max),
	day date,
	id int
)distkey(day)
	sortkey(day);


create table profile
(
	browse varchar(max),
	email varchar(256),
	geo varchar(max),
	count int,
	country varchar(5000),
	state varchar(max),
	zip varchar(max),
	lists_signup varchar(max),
	optout_reason varchar(1000),
	optout_time timestamp,
	signup_time timestamp,
	vars varchar(max),
	create_date timestamp,
	total_opens int,
	total_clicks int,
	total_unique_opens int,
	total_unique_clicks int,
	total_pageviews int,
	total_messages int,
	last_open timestamp,
	last_click timestamp,
	last_pageview timestamp,
	id varchar(1000)
)distkey(create_date)
	sortkey(create_date);
