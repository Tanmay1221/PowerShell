$file_path = '.\junk_files\'
$files_present = Get-ChildItem -Path $file_path -Recurse -File
$arr_available_extentions = @()
$arr_available_extentions = $files_present | Select-Object Extension | Sort-Object Extension | Get-Unique -asString
foreach ($item in $arr_available_extentions.Extension) {
    $folder_name = $item.Remove(0,1)
    $directory_path = "seperated_files\"+$folder_name
    #$directory_path
    if(!(Test-Path -path $directory_path))
    {
        New-Item -ItemType directory -Path $directory_path
    }
    else {
        Write-Host "$folder_name is present"
    }
}
foreach($item in $files_present){
    $extentions = $item.Extension.Remove(0,1)
    $directory = "seperated_files\$extentions"
    $start_path = "$item"
    Copy-Item $start_path $directory
}