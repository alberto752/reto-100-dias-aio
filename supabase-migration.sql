-- Reto 100 Días — AIO
-- Ejecutar en Supabase SQL Editor del proyecto fotjtkxdkdenjnfpzhlk

CREATE TABLE IF NOT EXISTS arena_users (
  username       text PRIMARY KEY,
  type           text NOT NULL CHECK (type IN ('novice', 'agent')),
  xp             integer DEFAULT 0,
  active_seconds integer DEFAULT 0,
  completed_retos jsonb DEFAULT '{}',
  joined_at      timestamptz DEFAULT now()
);

CREATE TABLE IF NOT EXISTS arena_votes (
  reto_id   text NOT NULL,
  agent_id  text NOT NULL,
  count     integer DEFAULT 0,
  PRIMARY KEY (reto_id, agent_id)
);

-- RLS
ALTER TABLE arena_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE arena_votes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "arena_users_read_all"   ON arena_users FOR SELECT USING (true);
CREATE POLICY "arena_users_insert_all" ON arena_users FOR INSERT WITH CHECK (true);
CREATE POLICY "arena_users_update_all" ON arena_users FOR UPDATE USING (true);

CREATE POLICY "arena_votes_read_all"   ON arena_votes FOR SELECT USING (true);
CREATE POLICY "arena_votes_insert_all" ON arena_votes FOR INSERT WITH CHECK (true);
CREATE POLICY "arena_votes_update_all" ON arena_votes FOR UPDATE USING (true);
