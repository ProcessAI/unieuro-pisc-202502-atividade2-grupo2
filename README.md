Guia do Usuário — Execução do Projeto
1) Pré-requisitos
Software

Python 3.10 ou superior (marque “Add Python to PATH” na instalação)

PostgreSQL 14+ (servidor + pgAdmin 4)

Git (opcional, só se for clonar do GitHub)

Acesso ao Banco

Host: localhost

Porta: 5432

Usuário: postgres

Senha: 123456 (ou a que você definiu)

Nome do banco: o mesmo usado no seu código e/ou dump (ex.: cadastro_academico ou postgres)

Se você subiu um backup.sql no repositório, mantenha-o junto ao código.

2) Bibliotecas Python necessárias

Instale com pip (recomendado: dentro de um ambiente virtual):

pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt

O que cada uma faz

sqlalchemy[postgresql] — ORM para modelar tabelas/CRUD.

psycopg[binary] — driver do PostgreSQL (binário pronto).

bcrypt — hash seguro de senhas.

Tkinter já vem com o Python no Windows. Em Linux/macOS, se faltar:

Ubuntu/Debian: sudo apt-get install python3-tk

Fedora: sudo dnf install python3-tkinter

macOS (brew): normalmente já vem; se faltar, reinstale Python via installer oficial.

3) Passo a passo (Windows / PowerShell)
3.1. Obter o código
cd C:\Users\aluno\Documents
git clone https://github.com/<seu-usuario>/<seu-repo>.git
cd <seu-repo>
# (ou baixe o ZIP do GitHub e entre na pasta)

3.2. (Opcional) Criar ambiente virtual
python -m venv venv
.\venv\Scripts\Activate.ps1


Para sair do venv: deactivate
Se o PowerShell bloquear, rode: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

3.3. Instalar as libs
pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt

3.4. Criar o banco (se não existir)

Via pgAdmin: Databases → Create… → nome (ex.: cadastro_academico)
Ou via comando:

set PGPASSWORD=123456
& "C:\Program Files\PostgreSQL\14\bin\createdb.exe" -U postgres -h localhost -p 5432 cadastro_academico

3.5. Configurar a conexão

No arquivo do projeto (ex.: app_gui.py), confirme a URL:

DATABASE_URL = "postgresql+psycopg://postgres:123456@localhost:5432/cadastro_academico"
# ou .../postgres se preferir usar o DB padrão


Alternativa (sem editar o código):

setx DATABASE_URL "postgresql+psycopg://postgres:123456@localhost:5432/cadastro_academico"
# abra um novo PowerShell depois do setx

3.6. (Opcional) Restaurar dados do dump

Se seu repositório contém backup.sql:

set PGPASSWORD=123456
& "C:\Program Files\PostgreSQL\14\bin\psql.exe" -U postgres -h localhost -p 5432 -d cadastro_academico -f ".\backup.sql"

3.7. Executar o programa
python app_gui.py


Na primeira execução, as tabelas são criadas automaticamente.

Abre a interface gráfica (Tkinter) com abas para Alunos, Professores, Salas, Registro e Listagem.

4) Passo a passo (Linux / macOS)
# 1) clonar
git clone https://github.com/<seu-usuario>/<seu-repo>.git
cd <seu-repo>

# 2) venv (opcional)
python3 -m venv venv
source venv/bin/activate

# 3) dependências
pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt
# se faltar Tkinter:
# Debian/Ubuntu: sudo apt-get install python3-tk

# 4) criar DB (se necessário)
createdb -U postgres -h localhost -p 5432 cadastro_academico

# 5) configurar URL
export DATABASE_URL="postgresql+psycopg://postgres:123456@localhost:5432/cadastro_academico"

# 6) rodar
python3 app_gui.py
