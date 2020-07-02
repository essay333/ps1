# 2020-07-03
# Azure VM의 Data Disk의 Host Cache 설정을 변경하는 PowerShell Script
# Data Disk가 여러 개인 경우, 모든 Data Disk의 Host Cache 설정을 동일하게 설정
# 중요 - Data Disk가 4TB 이상인 경우, Host Cache는 None 으로만 설정 가능 

$vmName = "yourVmName"
$vmResourceGroup ="yourResourceGroupName"
$hostCaching = "None" # or ReadWrite or ReadOnly

$vm = Get-AzVM -ResourceGroupName $vmResourceGroup -Name $vmName
$dataDisks = $vm.StorageProfile.DataDisks


foreach ( $disk in $dataDisks) {
    Set-AzVMDataDisk -VM $vm -Name $disk.Name -Caching $hostCaching
}

Update-azvm -VM $vm -ResourceGroupName $vmResourceGroup