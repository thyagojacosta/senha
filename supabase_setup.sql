-- Execute este SQL no SQL Editor do seu projeto Supabase

-- 1. Tabela de Senhas (Tickets)
create table if not exists public.medqueue_tickets (
  id uuid default gen_random_uuid() primary key,
  code text not null,
  prefix text not null,
  label text not null,
  status text not null default 'waiting', -- 'waiting' | 'called' | 'done'
  room text,
  created_at timestamptz default now(),
  called_at timestamptz
);

-- 2. Tabela de Salas / Consultórios
create table if not exists public.medqueue_rooms (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  created_at timestamptz default now()
);

-- Inserir salas iniciais padrão
insert into public.medqueue_rooms (name) values
  ('Consultório 01'),
  ('Consultório 02'),
  ('Triagem / Enfermagem'),
  ('Recepção Guichê 01')
on conflict (name) do nothing;

-- 3. Liberar acesso público (RLS) para funcionamento direto pelo app/totem/TV
alter table public.medqueue_tickets enable row level security;
alter table public.medqueue_rooms enable row level security;

create policy "Acesso total tickets" on public.medqueue_tickets
  for all using (true) with check (true);

create policy "Acesso total rooms" on public.medqueue_rooms
  for all using (true) with check (true);

-- 4. Ativar Realtime na tabela de senhas
alter publication supabase_realtime add table public.medqueue_tickets;
alter publication supabase_realtime add table public.medqueue_rooms;
