// ====== SUPABASE CONFIG — replace these two values ======
// Find them in your Supabase project: Settings > API
const SUPABASE_URL = "https://sdifkjtgsxedsauzszfh.supabase.co";
const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkaWZranRnc3hlZHNhdXpzemZoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM0MDgxMDcsImV4cCI6MjA5ODk4NDEwN30.cNgu18b1NT48U4o3wo52vUYPh52c7ui4WXQPxJgfZsQ";
// ==========================================================

let supabaseClient = null;

function initSupabase() {
  const configured = !SUPABASE_URL.startsWith("YOUR_") && !SUPABASE_ANON_KEY.startsWith("YOUR_");
  if (configured && window.supabase) {
    supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  }
  return supabaseClient;
}

document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector(".menu-toggle");
  const links = document.querySelector(".nav-links");
  if (toggle && links) {
    toggle.addEventListener("click", () => links.classList.toggle("open"));
  }
});
