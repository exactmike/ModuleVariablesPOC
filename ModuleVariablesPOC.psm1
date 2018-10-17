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
