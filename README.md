# Vango — Website

A simple 5-page site, no build tools, no framework:

- `index.html` — Home
- `our-kahani.html` — Our Kahani (the origin story)
- `how-it-works.html` — How It Works
- `reserve.html` — Reserve Your Spot (booking form)
- `reviews.html` — Reviews (live from Supabase + submission form)
- `style.css` — shared styling for every page
- `supabase-config.js` — shared Supabase connection settings
- `supabase_schema.sql` — the database schema to run once in Supabase

---

## 1. Deploy on GitHub Pages (auto-updates on every change)

**One-time setup:**

1. Create a new repository on GitHub (e.g. `vango-indian-kitchen`). Keep it Public.
2. In the folder with all these files:
   ```bash
   git init
   git add .
   git commit -m "Launch Vango site"
   git branch -M main
   git remote add origin https://github.com/YOUR-USERNAME/vango-indian-kitchen.git
   git push -u origin main
   ```
3. On GitHub: **Settings** > **Pages** > Source: `Deploy from a branch`,
   branch `main`, folder `/ (root)`. Save.
4. Your site is live in about a minute at:
   `https://YOUR-USERNAME.github.io/vango-indian-kitchen/`

**From now on**, any edit + `git add . && git commit -m "update" && git push`
updates the live site automatically.

**Custom domain (optional):** Settings > Pages > add your domain, then point
your registrar's DNS at GitHub Pages. Steps here:
https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site

---

## 2. Set up Supabase (for bookings + reviews)

1. Create a free project at https://supabase.com.
2. Go to **SQL Editor**, paste the entire contents of `supabase_schema.sql`,
   click **Run**. This creates the `reviews` and `bookings` tables with the
   right permissions already set (visitors can submit, only you can read
   bookings or approve reviews).
3. Go to **Settings > API**. Copy the **Project URL** and the **anon
   public** key (never the `service_role` key).
4. Open `supabase-config.js` and replace:
   ```js
   const SUPABASE_URL = "YOUR_SUPABASE_PROJECT_URL";
   const SUPABASE_ANON_KEY = "YOUR_SUPABASE_ANON_PUBLIC_KEY";
   ```
   with your real values. This one file feeds every page — you only edit
   it once.
5. Commit and push.

**Where to see submissions:** Supabase dashboard > Table Editor >
`bookings` or `reviews`.

**Approving a review:** open the row in `reviews`, set `approved` to
`true`. It'll appear on the live Reviews page automatically. Check the
`consent_public` column before you reuse a quote on Instagram/Facebook/
LinkedIn — it tells you whether the guest is fine with that.

**If you skip Supabase entirely:** the booking form falls back to opening
the visitor's email client, and the Reviews page keeps showing the three
sample reviews.

---

## 3. Before going fully live — replace these placeholders

Search across the files for:
- `hello@vango.example` → your real email
- `https://wa.me/491700000000` → your real WhatsApp number
  (format: `https://wa.me/49XXXXXXXXXX`, no spaces, no leading 0)
- `https://instagram.com/` in the footer → your real Instagram profile
- The photo placeholder on `our-kahani.html` → your own photo
- `YOUR_SUPABASE_PROJECT_URL` / `YOUR_SUPABASE_ANON_PUBLIC_KEY` in
  `supabase-config.js` → your real Supabase credentials
