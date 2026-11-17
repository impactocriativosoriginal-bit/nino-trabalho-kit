---
name: save
description: Fecha a sessão de trabalho do vault: faz a checagem final de captura (algo dito e não gravado?), salva o resumo da sessão no objeto certo, atualiza o foco da semana, tasks/todo.md e lessons.md, e deixa em dia o índice CLAUDE.md das pastas que mudaram. Use quando a Julia disser "/save", "salva", "fecha a sessão", "registra isso antes de fechar", "resume essa sessão" ou similar, ao final de um bloco de trabalho.
---

# Skill: /save · Fechamento de Sessão

> Fecha o expediente garantindo que nada da conversa se perdeu. A captura roda durante a conversa; o /save é a varredura final.

## Setup (leia antes de executar)
1. `.claude/CLAUDE.md`: §2 (captura), §3 (estrutura), §4 (roteamento).
2. `memoria/foco-da-semana.md` e `tasks/todo.md`.

## Fluxo (na ordem)

### 1. Checagem de captura (a etapa mais importante)
Varra a conversa inteira e liste todo fato que deveria estar gravado e ainda não foi:
- Fato sobre marca ou produto (público, voz, perfil, regra) → `marcas/<slug>/overview.md` (atualizar `status` e `updated`)
- Pessoa nova ou fato sobre pessoa → `pessoas/Nome Próprio.md`
- Pauta ou data de publicação → `calendario/YYYY-MM.md`
- Tarefa ou pendência mencionada → `tasks/todo.md`
- Correção que a Julia fez no trabalho → `tasks/lessons.md`
Grave cada um AGORA e anuncie em 1 linha por gravação.

### 2. Resumo da sessão no objeto certo
Se a sessão teve trabalho substancial, salvar `YYYY-MM-DD-<contexto-breve>.md` DENTRO do objeto principal (marca, peça em `producao/`, `reunioes/`, `documentos/`). Formato:

```markdown
---
data: YYYY-MM-DD
tipo: sessao
tema: <contexto-breve>
---

# <Contexto> · YYYY-MM-DD

## Decisões
- ...

## Informações novas
- ...

## Próximas ações
- [ ] <ação> · <dono> · <prazo ou "sem prazo">
```

### 3. Foco da semana (`memoria/foco-da-semana.md`)
- Se a data "Semana de:" tem 7+ dias (ou é segunda-feira): perguntar a prioridade da semana e reescrever o bloco, movendo o anterior para o Histórico.
- Se a sessão mudou o quadro (decisão grande, prioridade nova, bloqueio resolvido): atualizar só o que mudou.

### 4. Tasks
- `tasks/todo.md`: marcar concluídas (mover para "Concluídas" com data), adicionar novas.
- `tasks/lessons.md`: registrar padrão de qualquer correção recebida.

### 5. Memória de contexto (`memoria/MEMORY.md`)
Se a sessão trouxe algo que muda o contexto permanente (marca nova, mudança de rumo, regra da empresa, preferência forte), criar ou atualizar a nota em `memoria/` e manter o índice `MEMORY.md` em dia (1 linha por nota).

### 6. Índices de pasta em dia
Para cada pasta em que a sessão criou, renomeou, moveu ou arquivou arquivo: abrir o `<pasta>/CLAUDE.md` e atualizar a tabela, o status e a data. Pasta nova nasce com índice e entra na tabela de estrutura do `.claude/CLAUDE.md`. Divergiu, o arquivo vence: corrigir o índice.

### 7. Fechar
Perguntar: "Tem mais alguma coisa para registrar antes de fechar?" e listar em 3 a 5 linhas o que foi salvo e onde.

## Regras
- Kebab-case + data YYYY-MM-DD em tudo que gerar.
- Nunca usar o travessão "—".
- Nunca deletar: arquivar com timestamp em `arquivo/`.
- Nunca gravar senha, chave ou acesso.
- Resumo enxuto: registro operacional, não redação.
- Sessão trivial (só conversa, nada produzido): dizer isso e pular o passo 2.
