Param(
    [Parameter(Mandatory=$True,Position=1)]
    [string]$Subscription,
    
    [Parameter(Mandatory=$False)]
    [string]$Filter
)

Write-Output "Setting Azure context"
Set-AzContext -Subscription $Subscription

$fltr = $PSBoundParameters.ContainsKey("Filter") ? $Filter : "*"

Write-Output "Getting resource groups with name filter: $fltr"

$resourceGroups = Get-AzResourceGroup | Where-Object {$_.ResourceGroupName -like "$fltr"}

if ($resourceGroups.Count -gt 0) {
    Write-Output $resourceGroups
} else {
    Write-Output "No resource groups match the filter criteria."
    Exit
}

Write-Output "WARNING! Listed resource groups and all the contained resources will be deleted!"
Write-Output "This operation can't be undone."

$confirmation = Read-Host -Prompt "Do you want to continue? [Y]es / [N]o"
$alloweInput = "N", "Y"

if ($confirmation -inotin $alloweInput) {
    Write-Output "Invalid input. Exiting..."
    Exit
}

if ($confirmation -eq "n") {
    Write-Output "Aborted."
    Exit
}

Write-Output "Deleting resources..."

foreach ($rg in $resourceGroups) {
    Remove-AzResourceGroup $rg -Force
}

