# Crea finiture-offline.html: la stessa pagina con le librerie 3D incorporate, usabile senza rete.
# Uso: tasto destro > "Esegui con PowerShell", oppure:  powershell -ExecutionPolicy Bypass -File crea-versione-offline.ps1
$ErrorActionPreference = 'Stop'
$here = $PSScriptRoot
$lib = Join-Path $here 'lib'
New-Item -ItemType Directory -Force $lib | Out-Null
$cdn = 'https://cdn.jsdelivr.net/npm/'
$files = [ordered]@{
  'three'                                 = @('three.module.js',  'three@0.160.0/build/three.module.js')
  'three/addons/controls/OrbitControls.js' = @('OrbitControls.js', 'three@0.160.0/examples/jsm/controls/OrbitControls.js')
}
$entries = @()
foreach ($k in $files.Keys) {
  $path = Join-Path $lib $files[$k][0]
  if (-not (Test-Path $path)) { Invoke-WebRequest -UseBasicParsing -Uri ($cdn + $files[$k][1]) -OutFile $path }
  $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($path))
  $entries += "`"$k`":`"$b64`""
}
$boot = @"
<script>
// librerie 3D incorporate: vengono trasformate in indirizzi locali prima che parta il programma
(function(){ var L={$($entries -join ',')}, map={};
  for(var k in L){ var s=atob(L[k]), n=s.length, u=new Uint8Array(n); for(var i=0;i<n;i++) u[i]=s.charCodeAt(i); map[k]=URL.createObjectURL(new Blob([u],{type:'text/javascript'})); }
  var im=document.createElement('script'); im.type='importmap'; im.textContent=JSON.stringify({imports:map}); document.currentScript.after(im); })();
</script>
"@
$html = [IO.File]::ReadAllText((Join-Path $here 'finiture.html'))
$rx = New-Object regex('(?s)<script type="importmap">.*?</script>')
if (-not $rx.IsMatch($html)) { throw 'Blocco importmap non trovato in finiture.html' }
$html = $rx.Replace($html, { param($m) $boot }, 1)
$html = [regex]::Replace($html, '<link rel="stylesheet" href="https://fonts\.googleapis\.com[^>]*>\r?\n?', '')
$out = Join-Path $here 'finiture-offline.html'
[IO.File]::WriteAllText($out, $html, (New-Object Text.UTF8Encoding $false))
"Creato: finiture-offline.html ($([math]::Round((Get-Item $out).Length/1MB,2)) MB)"
