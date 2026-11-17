---
name: criar-pagina
description: Cria páginas bonitas e rápidas para o trabalho (briefing, one-pager, apresentação em HTML, relatório visual, landing de campanha) usando a identidade visual da empresa. Use quando a Julia pedir "criar página", "montar uma página de", "apresentação em HTML", "página de briefing", "página de relatório" ou similar.
---

# /criar-pagina

> Quem roda: o **Nino do Trabalho**. Página pequena, feita com capricho, na identidade da empresa. Briefing não é desculpa para página feia.

## Antes de começar
1. Ler `marca/promaxima-tokens.md` (cores, fontes, logo, tom). Sempre usar a logo oficial de `marca/assets/`, nunca redesenhar.
2. Descobrir 3 coisas, com no máximo 1 pergunta: **quem vai ver**, **qual a ação que a pessoa deve fazer** e **onde vai ser publicada** (interno, cliente, público).
3. Se a página for interna ou tiver dado da empresa, **não publicar em link aberto**. Usar `noindex` e pedir ok antes de publicar.

## Modo ágil (padrão)
1. **Estrutura em 1 mensagem:** seções e a ação principal. Sem pedir aprovação de cada detalhe.
2. **HTML estático, 1 arquivo** (CSS e JS dentro). Só usar framework se a página realmente precisar.
3. **Tokens primeiro:** cores, fontes e espaçamentos como variáveis CSS em `:root`, com tema escuro. Nada de cor solta.
4. **Identidade:** logo no topo, paleta da marca, fonte de título e de texto da marca. Foto e ilustração só se forem da empresa.
5. **Movimento com propósito:** entrada suave dos blocos, hover discreto, contagem de números, transição entre abas. Sempre respeitar `prefers-reduced-motion`.
6. **Mobile primeiro:** conferir em 390 px (sem rolagem horizontal, botões de 44 px) e depois em desktop.
7. **Conferir de verdade:** abrir no navegador (portal do Maestri ou Playwright), tirar print e corrigir antes de mostrar.
8. **Publicar só com ok da Julia.** Vercel para páginas simples; `vercel deploy --prod --yes` dentro da pasta.

## Skills de apoio (chamar quando precisar)
- `design-taste-frontend` e `impeccable`: direção de arte e revisão, contra o visual genérico.
- `emil-design-eng`, `animate`, `review-animations`: polimento e movimento.
- `better-layout`, `better-typography`, `better-colors`, `better-accessibility`: conferência por assunto.
- `gsap`: só em página com movimento mais elaborado.
- `humanizer` e `copy-editing`: texto da página.

## Regras
- Sem dado interno, número inventado ou depoimento inventado. Número só se vier de fonte da empresa.
- Nunca usar travessão "—" no texto. Usar vírgula, dois-pontos, parênteses ou ponto final.
- Página interna: `<meta name="robots" content="noindex, nofollow">` e sem proteção só se a Julia confirmar que o link pode ser aberto.
- Referência de página pronta neste repositório: `onboarding/index.html` (abas, progresso, logo, animações, tema claro e escuro).
- Ao terminar, anunciar em 1 linha o arquivo gravado e a próxima ação da Julia.
