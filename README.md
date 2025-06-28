# Sistema de Gerenciamento de Ocorrências

Este projeto integra modelagem e manipulação de banco de dados com práticas de controle de versão (Git/GitHub), sendo desenvolvido no contexto acadêmico para o curso de Tecnologia da Informação (2025/1).

---

## 📌 Objetivos

- Criar um modelo relacional para um sistema de gerenciamento de ocorrências.
- Manipular dados com comandos SQL (DDL + DML).
- Gerenciar o código e a evolução do projeto utilizando Git e GitHub.

---

## 📁 Estrutura do Projeto

```
📦 projeto/
├── 📁 sql/
│   ├── modelo_banco.sql         # Criação das tabelas
│   ├── inserts_teste.sql        # Dados de exemplo
│   └── consultas.sql            # Consultas úteis
├── .gitignore
├── README.md
└── bd.sql (consolidação inicial)
```

---

## 🛠️ Requisitos

- PostgreSQL ou outro SGDB compatível
- Git instalado

---

## 🧩 Banco de Dados

### Principais Tabelas:
- `Usuario`
- `Ocorrencia`
- `Localizacao`
- `HistoricoStatus`

### Comandos principais:
```sql
-- Criar as tabelas
psql -U seu_usuario -d nome_banco -f sql/modelo_banco.sql

-- Inserir dados de teste
psql -U seu_usuario -d nome_banco -f sql/inserts_teste.sql
```

---

## 🔁 Versionamento com Git

### Primeiros comandos:
```bash
git init
git add .
git commit -m "Commit inicial com estrutura do projeto"
git branch -M main
git remote add origin https://github.com/Anderson-crunk/BD_SisGer.git
git push -u origin main
```

### Boas práticas:
- Commits frequentes e descritivos
- Uso de branches para novas funcionalidades
- Tags para versões

---

## ✅ Status

- [x] Modelagem do banco de dados
- [x] Scripts de inserção e consulta
- [x] Controle de versão inicializado

---

## 📄 Licença

Projeto acadêmico sem fins lucrativos. Uso livre para fins educacionais.

---

**Desenvolvido por Anderson Miranda da Silva — 2025**
