# Protocolo de captura continua: lembrete injetado a cada mensagem (hook UserPromptSubmit).
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
"<protocolo-captura>Se esta mensagem contem fato novo sobre entidade (marca, produto, pessoa, decisao, prazo, numero, regra), grave AGORA no objeto certo do vault (.claude/CLAUDE.md secao 4) e anuncie em 1 linha. Se faltar dado-chave, faca no maximo 1 pergunta de completude. Tarefa mencionada vira item em tasks/todo.md, quebrada em passo pequeno. Nunca guardar senha, chave ou acesso no vault.</protocolo-captura>"
