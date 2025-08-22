# 📚 Cadastro Acadêmico — Python + Tkinter + PostgreSQL

Sistema acadêmico simples com **frontend gráfico (Tkinter)** e **backend em Python + PostgreSQL (SQLAlchemy)**.  
Permite gerenciar **alunos, professores, salas e registros de uso**.

---

## 🚀 Funcionalidades
- Adicionar **Alunos** (com matrícula)
- Adicionar **Professores** (com disciplina)
- Adicionar **Salas**
- Registrar uso de salas
- Listar registros em tabela filtrada por data
- Senhas seguras com **bcrypt**

---

## 🛠️ Pré-requisitos

### Software necessário
- **Python 3.10+**
- **PostgreSQL 14+**
- **Git** (opcional, para clonar o repositório)

### Banco de dados
- Host: `localhost`
- Porta: `5432`
- Usuário: `postgres`
- Senha: `123456`
- Banco: `cadastro_academico` (ou `postgres`)

---

## 📦 Bibliotecas Python necessárias

Instale com **pip**:

```bash
pip install "sqlalchemy[postgresql]" psycopg[binary] bcrypt
