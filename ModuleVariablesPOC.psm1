[int]$MyIntVariable = $null
[array]$MyArrayVariable = @()
[string]$MyStringVariable = $null
###############################################################################################
#Module Variables and Variable Functions
###############################################################################################
function Get-ModuleVariable 
{
param
(
[string]$Name
)
    Get-Variable -Scope Script -Name $name 
}
function Get-ModuleVariableValue 
{
param
(
[string]$Name
)
    Get-Variable -Scope Script -Name $name -ValueOnly
}
function Set-ModuleVariable 
{
param
(
[string]$Name
,
$Value
)
    Set-Variable -Scope Script -Name $Name -Value $value  
}
function New-ModuleVariable 
{
param 
(
[string]$Name
,
$Value
)
    New-Variable -Scope Script -Name $name -Value $Value
}
function Remove-ModuleVariable
{
param
(
[string]$Name
)
    Remove-Variable -Scope Script -Name $name
}
###############################################################################################
function Test-WriteLog {
    #test if an outside function called within a module function can see the module variable.  
    #Yes, it can.  Of course, after thinking about it, just like you can use any external to a module powershell command within your module.  
    Write-Log -Message $MyIntVariable -Verbose
}
Export-ModuleMember -Variable MyIntVariable