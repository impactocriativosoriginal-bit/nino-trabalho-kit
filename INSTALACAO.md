# Instalação do Nino do Trabalho

> Do zero ao ambiente pronto, em passos pequenos. A mesma lista existe, com checklist, na aba **Instalação** da página de onboarding.

## 0. Antes de começar
- Conta do Claude fornecida pela empresa.
- Conta do GitHub da Julia (o repositório do kit é privado).
- Confirmar com a empresa que pode instalar programas na máquina (ver "Se a máquina for restrita", no fim).

## 1. Programas
1. **Obsidian**: baixar em obsidian.md e instalar.
2. **Node.js (versão LTS) e Git**: baixar dos sites oficiais e instalar.
3. **Claude Code**: no terminal, `npm install -g @anthropic-ai/claude-code`. Rodar `claude` uma vez e entrar com a conta da empresa.
4. **Maestri**: instalar pelo mesmo caminho usado no ambiente de casa (painel onde os agentes trabalham à vista).

## 2. Baixar o kit
```powershell
git clone https://github.com/impactocriativosoriginal-bit/nino-trabalho-kit.git
cd nino-trabalho-kit
```
O Git vai pedir o login do GitHub da Julia.

## 3. Montar o vault
```powershell
powershell -ExecutionPolicy Bypass -File .\instalar.ps1
```
Cria o vault em `Documentos\ProMaxima-Marketing` (para outro lugar: `-Destino "C:\caminho"`). Não sobrescreve nada que já exista (use `-Forcar` só se quiser).

## 4. Instalar as skills globais
Dentro do Claude Code (`claude`), na pasta de qualquer projeto:
```text
/plugin marketplace add blader/humanizer
/plugin install humanizer@humanizer
```
No terminal:
```powershell
npx skills add coreyhaines31/marketingskills
```
Opcional (design e vídeo, já usados no ambiente de casa): `design-taste-frontend`, `impeccable`, `animate`, `gsap`, `hyperframes`. Instalar conforme a necessidade do trabalho.

## 5. Abrir e começar
1. Obsidian > **Abrir pasta como vault** > a pasta criada no passo 3.
2. Abrir o terminal **dentro dessa pasta** e rodar `claude`. O painel do dia aparece sozinho.
3. Abrir a página de onboarding, responder o briefing com a gestão e clicar em **Copiar respostas**.
4. No Claude: `/briefing` e colar as respostas. O Nino do Trabalho cadastra as marcas, pessoas, regras e o primeiro foco.
5. No fim do dia: `/save`.

## O que vem pronto
| Parte | O que é |
|---|---|
| `vault/` | Constituição (`.claude/CLAUDE.md`), pastas com índice, foco da semana, todo, modelo de marca |
| `agentes/` | Pauta, Verbo, Gigi, Senna, Hel, Mel (o Nino do Trabalho é a sessão principal) |
| `hooks/` | Painel de início do dia e protocolo de captura, sem voz |
| `skills/` | `briefing`, `save`, `criar-pagina` |
| `marca/` | Logo e tokens da identidade da ProMáxima |
| `onboarding/` | A página de briefing (https://promaxima-onboarding.vercel.app) |

## Se a máquina for restrita
- Sem permissão para instalar: pedir ao TI apenas Node.js, Git, Obsidian e Claude Code.
- Se o PowerShell bloquear scripts: o `instalar.ps1` é chamado com `-ExecutionPolicy Bypass` só para aquele comando. Se a política bloquear isso também, copiar as pastas à mão: `vault/*` para a raiz do vault, `agentes/` para `.claude/agents/`, `hooks/` para `.claude/hooks/`, `skills/` para `.claude/skills/`, `marca/` para `assets/marca/`.
- Os hooks de início do dia e captura usam PowerShell. Sem eles o vault funciona, só perde o painel automático.

## Regras
- Nada de senha, chave ou acesso dentro do vault ou do repositório.
- Nada de dado interno da empresa neste repositório (ele fica na conta pessoal). O vault de trabalho mora na máquina da empresa.
- Nada é publicado ou enviado sem a revisão da Julia.
