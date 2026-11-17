# Painel do vault de trabalho: injetado em toda sessao via hook SessionStart.
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$V = $env:CLAUDE_PROJECT_DIR
if (-not $V) { $V = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent }

"PAINEL DO VAULT (trabalho) · $(Get-Date -Format yyyy-MM-dd)"
""
"## Foco da Semana"
$foco = Join-Path $V "memoria\foco-da-semana.md"
if (Test-Path $foco) {
  $linhas = Get-Content -Encoding UTF8 $foco
  $dentro = $false
  foreach ($l in $linhas) {
    if ($l -match '^\*\*Semana de') { $dentro = $true }
    if ($dentro) { $l }
    if ($l -match '^\*\*Bloqueio') { break }
  }
  $semana = $linhas | Where-Object { $_ -match '^\*\*Semana de' } | Select-Object -First 1
  if ($semana -match '(\d{4}-\d{2}-\d{2})') {
    $dias = ((Get-Date).Date - [datetime]::ParseExact($Matches[1], 'yyyy-MM-dd', $null)).Days
    if ($dias -gt 7) {
      "ATENCAO: FOCO VENCIDO ($dias dias). Pergunte o foco da semana nova (1 prioridade principal) e atualize memoria/foco-da-semana.md antes de trabalho estrategico."
    }
  } else {
    "ATENCAO: foco da semana ainda nao definido. Pergunte a prioridade principal e grave em memoria/foco-da-semana.md."
  }
}
""
"## Onboarding"
$marcas = Join-Path $V "marcas"
$feitas = @()
if (Test-Path $marcas) { $feitas = Get-ChildItem $marcas -Directory | Where-Object { $_.Name -notlike '_*' } }
if ($feitas.Count -eq 0) {
  "ATENCAO: nenhuma marca cadastrada em marcas/. Sugira rodar /briefing com as respostas da pagina de onboarding."
} else {
  "Marcas cadastradas: " + (($feitas | ForEach-Object { $_.Name }) -join ", ")
}
""
"## Tarefas abertas (topo de tasks/todo.md)"
$todo = Join-Path $V "tasks\todo.md"
if (Test-Path $todo) {
  Get-Content -Encoding UTF8 $todo | Where-Object { $_ -match '^- \[ \]' } | Select-Object -First 5
}
""
"## Lembrete de captura"
"Todo fato novo dito pela Julia (marca, produto, pessoa, decisao, prazo, numero, regra) deve ser gravado no objeto certo NA HORA, com anuncio de 1 linha. Roteamento: .claude/CLAUDE.md secao 4. Respostas enxutas, proxima acao em destaque. Nada sai da empresa sem revisao da Julia."
