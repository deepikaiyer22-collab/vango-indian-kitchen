-- ============================================================
-- Vango — Supabase schema
-- Run this once in Supabase: Project > SQL Editor > New query > paste > Run
-- ============================================================

-- REVIEWS TABLE
create table if not exists reviews (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  name text not null,
  quote text not null,
  rating int not null check (rating between 1 and 5),
  consent_public boolean not null default true,
  approved boolean not null default false
);

alter table reviews enable row level security;

-- Anyone (the public website) can submit a review
create policy "Public can insert reviews"
on reviews for insert
to anon
with check (true);

-- Anyone can read only reviews that have been approved by you
create policy "Public can read approved reviews"
on reviews for select
to anon
using (approved = true);

-- Note: there is no public UPDATE or DELETE policy, so only you
-- (via the Supabase dashboard, logged in as the project owner) can
-- flip `approved` to true or edit/delete a review. This is what
-- keeps random internet submissions from appearing on your site
-- automatically. `consent_public` tells you whether the guest is
-- okay with you reusing their review on Instagram/Facebook/LinkedIn —
-- check it before you screenshot a quote for a post.

-- ============================================================

-- BOOKINGS TABLE
create table if not exists bookings (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  name text not null,
  email text not null,
  guests int,
  cuisine text,
  preferred_date date,
  message text
);

alter table bookings enable row level security;

-- Anyone (the public website) can submit a booking request
create policy "Public can insert bookings"
on bookings for insert
to anon
with check (true);

-- Deliberately no SELECT policy for anon — booking requests contain
-- personal contact info and should only be visible to you in the
-- Supabase dashboard (Table Editor > bookings), not to other website
-- visitors.

-- ============================================================
-- HOW TO VIEW YOUR DATA
-- Go to your Supabase project > Table Editor > reviews / bookings.
-- To publish a review on the site, open the row and set
-- `approved` to true.
-- ============================================================
