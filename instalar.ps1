# Monta o vault de trabalho a partir do kit.
# Uso (dentro da pasta do kit):  powershell -ExecutionPolicy Bypass -File .\instalar.ps1
# Opcoes: -Destino "C:\caminho\do\vault"   -Forcar (sobrescreve arquivos existentes)
param(
  [string]$Destino = (Join-Path ([Environment]::GetFolderPath("MyDocuments")) "ProMaxima-Marketing"),
  [switch]$Forcar
)
$ErrorActionPreference = "Stop"
$Kit = $PSScriptRoot
$novos = 0; $pulados = 0

function Copiar($origem, $destinoBase) {
  if (-not (Test-Path $origem)) { return }
  $raiz = (Resolve-Path $origem).Path
  Get-ChildItem $raiz -Recurse -Force -File | ForEach-Object {
    $rel = $_.FullName.Substring($raiz.Length).TrimStart('\')
    $alvo = Join-Path $destinoBase $rel
    New-Item -ItemType Directory -Force (Split-Path $alvo -Parent) | Out-Null
    if ((Test-Path $alvo) -and -not $Forcar) { $script:pulados++ }
    else { Copy-Item $_.FullName $alvo -Force; $script:novos++ }
  }
}

Write-Host "Destino: $Destino"
New-Item -ItemType Directory -Force $Destino | Out-Null

# 1) Estrutura do vault (inclui .claude\CLAUDE.md e settings.json)
Copiar (Join-Path $Kit "vault")   $Destino
# 2) Agentes, hooks, skills e marca
Copiar (Join-Path $Kit "agentes") (Join-Path $Destino ".claude\agents")
Copiar (Join-Path $Kit "hooks")   (Join-Path $Destino ".claude\hooks")
Copiar (Join-Path $Kit "skills")  (Join-Path $Destino ".claude\skills")
Copiar (Join-Path $Kit "marca")   (Join-Path $Destino "assets\marca")
# 2b) Duda (Codex): instrucoes, briefings e saida de imagens
Copiar (Join-Path $Kit "codex")   (Join-Path $Destino "codex")

# 3) Pastas que o Git nao guarda vazias
@("producao\posts","producao\impressos","producao\videos","producao\paginas","conhecimento\raw","conhecimento\wiki") |
  ForEach-Object { New-Item -ItemType Directory -Force (Join-Path $Destino $_) | Out-Null }

Write-Host ""
Write-Host "Pronto. Arquivos copiados: $novos. Ja existiam e foram mantidos: $pulados."
Write-Host ""
Write-Host "Proximos passos:"
Write-Host "  1) Obsidian > Abrir pasta como vault > $Destino"
Write-Host "  2) Abrir o terminal DENTRO dessa pasta e rodar:  claude"
Write-Host "  3) Digitar:  /briefing   (e colar as respostas copiadas da pagina de onboarding)"

