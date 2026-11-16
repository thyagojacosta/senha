# MedQueue Cloud - APK Android + Supabase Realtime

## Passo 1: Configurar o Banco no Supabase
1. Acesse seu painel no **Supabase** > **SQL Editor**.
2. Cole e execute todo o conteúdo do arquivo `supabase_setup.sql` incluso neste pacote.
3. Vá em **Project Settings > API** e copie sua **Project URL** e a **anon public key**.

## Passo 2: Gerar o APK no GitHub Actions
1. Envie os arquivos desta pasta para um repositório no GitHub.
2. Abra a aba **Actions**, selecione **Compilar APK Android (MedQueue Supabase)** e clique em **Run workflow**.
3. Baixe o artefato `MedQueue-Cloud-APK.zip` e instale o `app-debug.apk` nos dispositivos.

## Passo 3: Conectar os Aparelhos
1. Abra o app no Tablet (Totem), na Android TV Box (Painel TV) e no celular/PC da Recepção.
2. Clique em **⚙ Cloud**, informe a **Project URL** e a **Anon Public Key** e salve.
3. Todas as senhas emitidas no Totem aparecerão instantaneamente na Recepção e serão chamadas com voz na TV!
