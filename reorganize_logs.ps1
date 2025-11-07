# RF2T Log Reorganization Script
# Reorganizes old format logs into model-based directory structure

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$logsPath = Join-Path $scriptPath "LOGS"

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "RF2T Log Reorganization Tool" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $logsPath)) {
    Write-Host "ERROR: LOGS folder not found!" -ForegroundColor Red
    exit 1
}

Write-Host "Scanning log files..." -ForegroundColor White
Write-Host "Path: $logsPath" -ForegroundColor Gray
Write-Host ""

$logFiles = Get-ChildItem -Path $logsPath -Filter "RFLog_*.csv" -File

if ($logFiles.Count -eq 0) {
    Write-Host "No log files found!" -ForegroundColor Yellow
    exit 0
}

Write-Host "Found $($logFiles.Count) log files" -ForegroundColor Green
Write-Host ""

$totalProcessed = 0
$modelStats = @{}

foreach ($file in $logFiles) {
    Write-Host "Processing: $($file.Name)" -ForegroundColor White
    
    $lines = Get-Content -Path $file.FullName -Encoding UTF8
    
    if ($lines.Count -eq 0) {
        Write-Host "  - Empty file, skipped" -ForegroundColor Yellow
        continue
    }
    
    $modelGroups = @{}
    $lineCount = 0
    
    foreach ($line in $lines) {
        if ([string]::IsNullOrWhiteSpace($line)) {
            continue
        }
        
        $fields = $line -split '\|'
        
        if ($fields.Count -lt 2) {
            Write-Host "  - Warning: Invalid line skipped" -ForegroundColor Yellow
            continue
        }
        
        $modelName = $fields[1].Trim()
        
        if ([string]::IsNullOrWhiteSpace($modelName)) {
            Write-Host "  - Warning: No model name, skipped" -ForegroundColor Yellow
            continue
        }
        
        if (-not $modelGroups.ContainsKey($modelName)) {
            $modelGroups[$modelName] = @()
        }
        $modelGroups[$modelName] += $line
        $lineCount++
        
        if (-not $modelStats.ContainsKey($modelName)) {
            $modelStats[$modelName] = 0
        }
        $modelStats[$modelName]++
    }
    
    Write-Host "  - Read $lineCount lines, $($modelGroups.Count) models" -ForegroundColor Gray
    
    foreach ($modelName in $modelGroups.Keys) {
        $modelPath = Join-Path $logsPath $modelName
        if (-not (Test-Path $modelPath)) {
            New-Item -Path $modelPath -ItemType Directory -Force | Out-Null
            Write-Host "  - Created folder: $modelName" -ForegroundColor Green
        }
        
        $newFilePath = Join-Path $modelPath $file.Name
        
        $content = $modelGroups[$modelName] -join "`n"
        
        if (Test-Path $newFilePath) {
            $existingLines = Get-Content -Path $newFilePath -Encoding UTF8
            $allLines = $existingLines + $modelGroups[$modelName]
            $uniqueLines = $allLines | Select-Object -Unique
            $uniqueLines | Set-Content -Path $newFilePath -Encoding UTF8
            $msg = "  - Updated: $modelName/$($file.Name) (" + $modelGroups[$modelName].Count + " lines)"
            Write-Host $msg -ForegroundColor Cyan
        } else {
            $modelGroups[$modelName] | Set-Content -Path $newFilePath -Encoding UTF8
            $msg = "  - Created: $modelName/$($file.Name) (" + $modelGroups[$modelName].Count + " lines)"
            Write-Host $msg -ForegroundColor Green
        }
    }
    
    $totalProcessed++
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Reorganization Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Files processed: $totalProcessed" -ForegroundColor White
Write-Host "Models found: $($modelStats.Count)" -ForegroundColor White
Write-Host ""
Write-Host "Model statistics:" -ForegroundColor Yellow

foreach ($model in $modelStats.Keys | Sort-Object) {
    Write-Host "  $model : $($modelStats[$model]) logs" -ForegroundColor White
}

Write-Host ""
Write-Host "Reorganization completed!" -ForegroundColor Green
Write-Host "New log files saved in model subfolders" -ForegroundColor Cyan
Write-Host ""

# Delete original files
Write-Host "Deleting original files..." -ForegroundColor Yellow
$deleteCount = 0
foreach ($file in $logFiles) {
    try {
        Remove-Item -Path $file.FullName -Force -ErrorAction Stop
        Write-Host "  - Deleted: $($file.Name)" -ForegroundColor Gray
        $deleteCount++
    } catch {
        Write-Host "  - Failed to delete: $($file.Name)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Deleted $deleteCount original files" -ForegroundColor Green
Write-Host "All operations completed successfully!" -ForegroundColor Cyan
Write-Host ""

