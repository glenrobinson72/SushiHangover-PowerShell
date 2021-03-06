function ConvertTo-ShortcutKeyTable
{
    <#
    .Synopsis
        Converts a hierarchical menu into a table of shortcuts
    .Description
        Converts a menu specified as a hashtable (for use with Add-IseMenu) to
        a flat list of objects
    .Example
        ConvertTo-ShortcutKeyTable @{
            "Edit Profile" = { psedit $profile } | 
                Add-Member NoteProperty ShortcutKey "CTRL + E" -PassThru
        }
    .Link
        Add-IseMenu
    #>
    param(
    #The Menu Hashtable supplied to Add-IseMenu
    [Parameter(ValueFromPipeline=$true)]
    [Hashtable]
    $hashtable
    )
        
    process {
        $hashtable.GetEnumerator() | ForEach-Object {
            if ($_.Value.ShortcutKey) {
                New-Object Object | 
                    Add-Member NoteProperty MenuItem $_.Key -PassThru | 
                    Add-Member NoteProperty ShortcutKey $_.Value.ShortcutKey -PassThru
            }
            if ($_.Value -is [Hashtable]) {
                $_.Value | ConvertTo-ShortcutKeyTable
            }
        }
    }
    
}