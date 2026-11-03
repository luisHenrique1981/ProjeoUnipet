<div align="center">

# 🐾 UniPet

### Tecnologia a serviço do bem-estar animal nos campi universitários

**Sistema para gestão e acompanhamento de animais errantes em instituições de ensino superior.**

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-FFB900?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)

</div>

## 📖 Sobre o projeto

O **UniPet** é um projeto acadêmico que propõe uma plataforma digital para apoiar o **manejo de cães e gatos errantes em campi universitários**. A iniciativa surgiu da necessidade de centralizar informações sobre os animais, facilitar o registro de ocorrências e apoiar ações de cuidado, adoção, conscientização e controle populacional.

A proposta é aproximar **comunidade acadêmica, voluntários e administração institucional**, transformando registros dispersos em informações organizadas e indicadores úteis para a tomada de decisão.

> 🎓 Projeto desenvolvido no contexto do curso de **Tecnologia em Sistemas para Internet**, do **Instituto Federal de Rondônia (IFRO), Campus Porto Velho Zona Norte**.

## 🎯 Objetivos

- Centralizar o cadastro e o acompanhamento de animais encontrados nos campi.
- Facilitar a comunicação de avistamentos, abandono, ferimentos e outras ocorrências.
- Organizar dados de saúde, vacinação e histórico dos animais.
- Dar visibilidade às iniciativas de adoção, voluntariado e doação.
- Disponibilizar relatórios e indicadores para apoiar a gestão institucional.
- Incentivar a guarda responsável e o bem-estar animal.

## ✨ Funcionalidades propostas

As funcionalidades abaixo representam o **escopo planejado e prototipado** do UniPet. Nem todas estão necessariamente implementadas na versão atual do repositório.

| Módulo | Descrição |
| --- | --- |
| 🏠 Página inicial | Exibição de animais, notícias, ações e informações relevantes. |
| 🐕 Cadastro de animais | Registro de identificação, fotos, características e localização dos animais. |
| 🩺 Acompanhamento de saúde | Organização de dados clínicos, vacinação e histórico de cuidados. |
| 📍 Registro de ocorrências | Comunicação de avistamentos, abandono, animais feridos e outras situações. |
| 🏡 Adoção | Divulgação de animais disponíveis para adoção. |
| 🤝 Voluntariado e doações | Apoio à participação da comunidade em ações de proteção animal. |
| 📊 Painel de indicadores | Gráficos, estatísticas e relatórios para apoiar decisões. |
| 👥 Perfis de acesso | Experiências e permissões adequadas a usuários e administradores. |

## 🎨 Protótipos e interface

O projeto conta com estudos de interface para **desktop e dispositivos móveis**, incluindo página inicial, perfil do animal, registro de ocorrências, formulários e visualização de indicadores.

A identidade visual utiliza cores associadas à natureza, ao cuidado e à comunicação:

| Cor | Hexadecimal | Uso sugerido |
| --- | --- | --- |
| 🟢 Verde | `#165823` | Ações positivas e elementos principais |
| 🟠 Amarelo | `#FFB900` | Destaques e avisos |
| 🔵 Azul | `#0D47A1` | Informações e ações secundárias |
| 🔴 Vermelho | `#DF301C` | Alertas e situações urgentes |

O desenvolvimento das telas busca considerar princípios de **UI, UX, responsividade e acessibilidade**.

## 🛠️ Tecnologias

Tecnologias identificadas na estrutura e nas dependências do repositório:

| Camada | Tecnologias |
| --- | --- |
| Interface | Flutter e Dart |
| API / Back-end | Python e Flask |
| Persistência | Flask-SQLAlchemy e SQLAlchemy |
| Migrações | Flask-Migrate e Alembic |
| Bancos de dados | SQLite como configuração padrão; suporte configurável a PostgreSQL via `psycopg` |
| Integração | Flask-CORS |
| Versionamento | Git e GitHub |

## 📁 Estrutura do repositório

```text
ProjeoUnipet/
├── app/                 # Pacote da aplicação Python
├── frontend_unipet/     # Aplicação Flutter
├── tests/               # Testes
├── app.py               # Aplicação Flask e rotas de status
├── run.py               # Ponto de entrada alternativo do back-end
├── config.py            # Configuração da aplicação e do banco
├── requirements.txt     # Dependências Python
├── .env.example         # Modelo para variáveis de ambiente
└── .gitignore
```

> A organização de arquivos pode mudar à medida que o desenvolvimento avançar.

## 🚀 Como executar localmente

### Pré-requisitos

- Git
- Python 3 e `pip`
- Flutter SDK e Dart
- Um navegador ou emulador/dispositivo compatível com Flutter

### 1. Clonar o repositório

```bash
git clone https://github.com/luisHenrique1981/ProjeoUnipet.git
cd ProjeoUnipet
```

### 2. Preparar o back-end

Crie e ative um ambiente virtual:

**Windows (PowerShell):**

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
```

**Linux/macOS:**

```bash
python3 -m venv venv
source venv/bin/activate
```

Instale as dependências:

```bash
pip install -r requirements.txt
```

A aplicação dispõe de um ponto de entrada básico em `app.py`:

```bash
python app.py
```

Com o servidor em execução, a API básica pode ser consultada em:

- `http://127.0.0.1:5000/`
- `http://127.0.0.1:5000/api/status`

**Observação:** também existe um `run.py` que usa `create_app()` do pacote `app`. A execução desse ponto de entrada depende da configuração desse pacote. Ajustes na conexão com o banco e nas demais rotas podem ser necessários conforme o estágio do desenvolvimento.

### 3. Preparar o front-end Flutter

Em outro terminal:

```bash
cd frontend_unipet
flutter pub get
flutter run
```

Selecione o dispositivo de execução disponível. Para executar no Chrome, caso o suporte web esteja habilitado:

```bash
flutter run -d chrome
```

> A execução conjunta do front-end e do back-end e a integração completa das funcionalidades dependem da implementação das respectivas telas, rotas e configurações.

## 🗺️ Etapas de desenvolvimento

- [x] Definição do problema e dos objetivos do projeto
- [x] Elaboração de protótipos de interface
- [x] Estrutura inicial de front-end Flutter e back-end Flask
- [ ] Concluir a implementação e a integração dos módulos
- [ ] Consolidar cadastros, ocorrências e acompanhamento dos animais
- [ ] Integrar relatórios e indicadores
- [ ] Realizar testes funcionais, de usabilidade e acessibilidade
- [ ] Preparar uma versão para demonstração

*Os itens pendentes representam etapas previstas, não necessariamente tarefas já iniciadas.*

## 🌱 Impacto esperado

O UniPet busca contribuir para uma gestão mais organizada e responsável dos animais errantes nos campi universitários, oferecendo informações que apoiem **prevenção de zoonoses, acompanhamento sanitário, adoção e ações de conscientização**. O objetivo final é unir tecnologia e responsabilidade socioambiental em uma ferramenta útil à comunidade acadêmica.

## 👨‍💻 Autores

- **Lais Alves da Silva**
- **Luis Henrique Oliveira da Silva**

**Instituição:** Instituto Federal de Educação, Ciência e Tecnologia de Rondônia (IFRO)  
**Campus:** Porto Velho Zona Norte  
**Curso:** Tecnologia em Sistemas para Internet

## 📌 Situação do projeto

**Em desenvolvimento.** Este repositório reúne a implementação progressiva do UniPet. Funcionalidades, estrutura e instruções podem ser atualizadas nas próximas versões.

---

<div align="center">

**🐾 UniPet — Mais cuidado, informação e oportunidades para os animais.**

</div>
