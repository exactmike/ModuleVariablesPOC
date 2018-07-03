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
function Get-FirstNonNullEmptyStringVariableValueFromScopeHierarchy
{
    Param(
        [string]$VariableName
        ,
        [int]$ScopeLevels = 15
        ,
        [int]$timeout = 500 #In Milliseconds
    )
    $scope = 0
    $stopwatch = [Diagnostics.Stopwatch]::StartNew()
    do
    {
        Try
        {
            $value = Get-Variable -Name $VariableName -ValueOnly -Scope $scope -ErrorAction SilentlyContinue
        }
        Catch
        {
        }
        $scope++
    }
    until (-not [string]::IsNullOrWhiteSpace($value) -or $stopwatch.ElapsedMilliseconds -ge $timeout -or $scope -ge $ScopeLevels)
    $value
}
#end function Get-FirstNonNullEmptyStringVariableValueFromScopeHierarchy
###############################################################################################
function Test-WriteLog
{
    #test if an outside function called within a module function can see the module variable.
    #Yes, it can.  Of course, after thinking about it, just like you can use any external to a module powershell command within your module.
    Write-Log -Message $MyIntVariable -Verbose
}
Export-ModuleMember -Variable MyIntVariable