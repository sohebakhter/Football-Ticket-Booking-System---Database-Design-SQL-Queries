-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;

DROP TABLE IF EXISTS Matches;

DROP TABLE IF EXISTS Users;

-- 1. CREATE USERS TABLE
CREATE TABLE
    Users (
        user_id serial primary key,
        full_name varchar(50),
        email varchar(100) unique,
        role varchar(20) check (role in ('Ticket Manager', 'Football Fan')),
        phone_number varchar(20)
    );

-- 2. CREATE MATCHES TABLE
CREATE TABLE
    Matches (
        match_id serial primary key,
        fixture varchar(100),
        tournament_category varchar(50),
        base_ticket_price int check (base_ticket_price >= 0),
        match_status varchar(20) check (
            match_status in (
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        )
    );

-- 3. CREATE BOOKINGS TABLE
CREATE TABLE
    Bookings (
        booking_id serial primary key,
        user_id int not null references users (user_id),
        match_id int not null references matches (match_id),
        seat_number varchar(10),
        payment_status varchar(20) check (
            payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
        ),
        total_cost int check (total_cost >= 0)
    );

-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
INSERT INTO
    Users (user_id, full_name, email, role, phone_number)
VALUES
    (
        1,
        'Tanvir Rahman',
        'tanvir@mail.com',
        'Football Fan',
        '+8801711111111'
    ),
    (
        2,
        'Asif Haque',
        'asif@mail.com',
        'Football Fan',
        '+8801722222222'
    ),
    (
        3,
        'Sajjad Rahman',
        'sajjad@mail.com',
        'Ticket Manager',
        '+8801733333333'
    ),
    (
        4,
        'Jannat Ara',
        'jannat@mail.com',
        'Football Fan',
        NULL
    );

-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
INSERT INTO
    Matches (
        match_id,
        fixture,
        tournament_category,
        base_ticket_price,
        match_status
    )
VALUES
    (
        101,
        'Real Madrid vs Barcelona',
        'Champions League',
        150.00,
        'Available'
    ),
    (
        102,
        'Man City vs Liverpool',
        'Premier League',
        120.00,
        'Selling Fast'
    ),
    (
        103,
        'Bayern Munich vs PSG',
        'Champions League',
        130.00,
        'Available'
    ),
    (
        104,
        'AC Milan vs Inter Milan',
        'Serie A',
        90.00,
        'Sold Out'
    ),
    (
        105,
        'Juventus vs Roma',
        'Serie A',
        80.00,
        'Available'
    );

-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
INSERT INTO
    Bookings (
        booking_id,
        user_id,
        match_id,
        seat_number,
        payment_status,
        total_cost
    )
VALUES
    (501, 1, 101, 'A-12', 'Confirmed', 150.00),
    (502, 1, 102, 'B-04', 'Confirmed', 120.00),
    (503, 2, 101, 'A-13', 'Confirmed', 150.00),
    (504, 2, 101, NULL, NULL, 150.00),
    (505, 3, 102, 'C-20', 'Pending', 120.00);

-- =========================================================================
--Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
select
    match_id,
    fixture,
    base_ticket_price
from
    matches
where
    match_status = 'Available'
    and tournament_category = 'Champions League';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
select
    user_id,
    full_name,
    email
from
    users
where
    full_name ilike ('Tanvir%')
    or full_name ilike ('%Haque%')
    -- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
select
    booking_id,
    user_id,
    match_id,
    coalesce(payment_status, 'Action Required') as systematic_status
from
    bookings
where
    payment_status is null;

-- Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
select
    booking_id,
    full_name,
    fixture,
    total_cost
from
    bookings as b
    inner join users as u on (b.user_id = u.user_id)
    inner join matches as m on (m.match_id = b.match_id);