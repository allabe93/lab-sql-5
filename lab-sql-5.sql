-- 1. Drop column picture from staff.
alter table staff
drop column picture;

select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff (staff_id, first_name, last_name, address_id, email, store_id, `active`, username, `password`, last_update)
values ('3', 'Tammy', 'Sanders', '79', 'Tammy.Sander@sakilastaff.com', '2', '1', 'Tammy', NULL, '2022-11-12 03:00:00');

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id)
values(current_timestamp(), '4', '130', NULL, '1');

select * from rental order by rental_date desc;

-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- 4.1. Check if there are any non-active users.
select * from customer where active = 0;

-- 4.2. Create a table backup table as suggested.
create table deleted_users (
customer_id int unique not null, 
email varchar(50) default null, 
`date` datetime default null, 
constraint primary key (customer_id)
);

-- 4.3. Insert the non active users in the table backup table.
insert into deleted_users (customer_id, email, date)
select customer_id, email, create_date
from customer
where active = 0;

select * from deleted_users;

-- 4.4. Delete the non active users from the table customer.
delete from customer where active = 0;

select * from customer where active = 0;