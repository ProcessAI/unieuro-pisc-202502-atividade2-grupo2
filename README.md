# 📚 Cadastro Acadêmico — Python + Tkinter + PostgreSQL

Sistema acadêmico com **frontend gráfico (Tkinter)** e **backend em Python + PostgreSQL (SQLAlchemy)**.  
Permite gerenciar **alunos, professores, salas e registros de uso**.

---

## 🚀 Funcionalidades
- Cadastro de **Alunos** (com matrícula)
- Cadastro de **Professores** (com disciplina)
- Cadastro de **Salas**
- Registro de uso de salas
- Listagem de registros filtrados por data
- Senhas seguras com **bcrypt**

---

## 🛠️ Requisitos

### Software
- **Python 3.10+**
- **PostgreSQL 14+**
- **Git** (opcional, para clonar do GitHub)

### Banco de Dados
- Host: `localhost`
- Porta: `5432`
- Usuário: `postgres`
- Senha: `123456`
- Banco: **`postgres`** (banco padrão já existente)

---

## 🗄️ Estrutura do Banco de Dados

O app cria as tabelas automaticamente ao iniciar (se não existirem).  
As tabelas já estão dentro do banco **`postgres`**, no schema **`public`**:

### `usuario`
| Campo        | Tipo       | Observação                      |
|--------------|-----------|----------------------------------|
| `id_usuario` | SERIAL PK | Identificador único              |
| `nome`       | VARCHAR   | Nome do usuário                  |
| `email`      | VARCHAR   | Único (Unique)                   |
| `senha`      | VARCHAR   | Hash da senha (bcrypt)           |
| `tipo`       | VARCHAR   | Pode ser `aluno` ou `professor`  |

### `aluno`
| Campo        | Tipo       | Observação                          |
|--------------|-----------|--------------------------------------|
| `id_aluno`   | SERIAL PK | Identificador único                  |
| `matricula`  | VARCHAR   | Número de matrícula                  |
| `id_usuario` | INT       | FK → `usuario.id_usuario` (aluno)    |

### `professor`
| Campo          | Tipo       | Observação                           |
|----------------|-----------|---------------------------------------|
| `id_professor` | SERIAL PK | Identificador único                   |
| `disciplina`   | VARCHAR   | Nome da disciplina                    |
| `id_usuario`   | INT       | FK → `usuario.id_usuario` (professor) |

### `sala`
| Campo      | Tipo       | Observação           |
|------------|-----------|-----------------------|
| `id_sala`  | SERIAL PK | Identificador único   |
| `nome`     | VARCHAR   | Nome da sala (único)  |

### `registro`
| Campo          | Tipo       | Observação                             |
|----------------|-----------|-----------------------------------------|
| `id_registro`  | SERIAL PK | Identificador único                     |
| `id_usuario`   | INT       | FK → `usuario.id_usuario`               |
| `id_sala`      | INT       | FK → `sala.id_sala`                     |
| `data`         | DATE      | Data de utilização da sala              |

---

## 📦 Bibliotecas Python

Instale com **pip**:

```bash
pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt
```

▶️ Passo a Passo 
1. Obter o projeto
cd C:\Users\aluno\Documents
git clone https://github.com/<seu-usuario>/<seu-repo>.git
cd <seu-repo>


Ou baixe o ZIP do GitHub e extraia.

2. (Opcional) Ambiente virtual
python -m venv venv
.\venv\Scripts\Activate.ps1

3. Instalar bibliotecas
pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt

4. Configurar a conexão

No app_gui.py:

DATABASE_URL = "postgresql+psycopg://postgres:123456@localhost:5432/postgres"


Ou defina variável de ambiente:

setx DATABASE_URL "postgresql+psycopg://postgres:123456@localhost:5432/postgres"

5. (Opcional) Restaurar backup
set PGPASSWORD=123456
& "C:\Program Files\PostgreSQL\14\bin\psql.exe" -U postgres -h localhost -p 5432 -d postgres -f ".\backup.sql"

6. Executar o app
python app_gui.py
