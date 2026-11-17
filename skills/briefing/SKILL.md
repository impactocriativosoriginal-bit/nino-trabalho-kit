---
name: briefing
description: Onboarding do marketing na ProMáxima. Recebe as respostas do briefing (copiadas da página de onboarding) e distribui no vault: marcas, pessoas, calendário, regras, tarefas e foco. Também conduz a entrevista quando faltar resposta. Use quando a Julia disser "/briefing", "onboarding", "colei as respostas do briefing" ou colar um texto que começa com "# Briefing de onboarding de marketing".
---

# Skill: /briefing · Onboarding

> Transforma o briefing em memória útil. Quem roda: o **Nino do Trabalho**, direto com a Julia (subagente não entrevista).

## Setup
1. `.claude/CLAUDE.md` (§3 estrutura e §4 roteamento) e `marcas/_modelo/overview.md`.
2. Se existir `marcas/`, listar o que já foi cadastrado para não duplicar.

## Entrada
O texto copiado da página de onboarding, em Markdown: blocos "Marcas e produtos", "Redes e entregas", "Fluxo e aprovação", "Identidade visual e voz", "Ferramentas e acessos", "Métricas e relatórios" e "Primeiros 30 dias". Respostas "(sem resposta)" são lacunas.

## Fluxo

### 1. Ler e separar
Ler tudo, sem gravar ainda. Montar mentalmente: marcas e produtos, perfis, públicos, regras, pessoas, prazos, ferramentas, números.

### 2. Gravar (e anunciar cada gravação em 1 linha)
- **Cada marca ou produto** → `marcas/<slug>/overview.md` a partir do modelo: perfil (@), público, objetivo, voz e tom, palavras proibidas ou preferidas, formatos, frequência, aprovação, prioridade. Slug em kebab-case.
- **Pessoas citadas** (quem aprova, quem pede, contatos) → `pessoas/Nome Próprio.md`.
- **Fluxo e aprovação** (quem aprova o quê, prazo, como chegam os pedidos, reunião fixa) → `memoria/fluxo-de-trabalho.md` e uma linha no `memoria/MEMORY.md`.
- **Ferramentas e acessos** → `memoria/ferramentas.md` (só nomes das ferramentas e quem libera; **nunca senha, link privado ou chave**).
- **Regras e limites** ("o que não publicar sem alinhar", uso de IA, orçamento) → `memoria/regras-da-empresa.md`.
- **Identidade visual** → se citarem manual de marca, anotar onde está e pedir os arquivos para `assets/marca/`. Divergência com `promaxima-tokens.md`: o manual vence.
- **Métricas** (números acompanhados, quem recebe, frequência) → `relatorios/CLAUDE.md` (seção "Combinados").
- **Frequência e formatos** → `calendario/CLAUDE.md` (seção "Combinados") e esqueleto do mês atual em `calendario/YYYY-MM.md`.
- **Primeira entrega e prazo** → `tasks/todo.md` e `memoria/foco-da-semana.md`.

### 3. Lacunas
Listar o que ficou "(sem resposta)" ou "confirmar" em ordem de impacto. **No máximo 3 perguntas** agora; o resto vira item no `tasks/todo.md` ("descobrir com <pessoa>: ...").

### 4. Fechar
Mostrar em 5 linhas: o que foi cadastrado, o que ficou em aberto e a **próxima ação** da Julia. Sugerir `/save`.

## Regras
- Não inventar. Dado sem fonte vira "confirmar".
- Nunca gravar senha, token ou acesso.
- Nunca usar o travessão "—".
- Atualizar `updated` no frontmatter e os índices `CLAUDE.md` das pastas tocadas.
