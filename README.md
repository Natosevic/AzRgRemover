# AzRgRemover

## DISCLAIMER
For educational purposes only. Don't run this code in you Azure environment without reviewing and understanding what it does.
It might cause loss of data if used without care.

### About
Simple PowerShell script for bulk removal of resource groups and resources.
Provided a Subscription ID or name, and an optional filter, the script will set the Azure context, list all the resource groups matching the filter and remove them upon confirmation.
If the filter is omitted, * will be used as default, matching all the resource groups in the subscription.


### Parameters:
* Subscription - ID or name of the Azure subscription
* Filter - String filter to match resource group names

### Examples
Remove all resource groups in subscription "Test_Subscription_1"
```
.\AzRgRemove.ps1 -Subscription "Test_Subsription-1"
```
Remove all resource groups with names starting with "Test" in subscription "Test_Subscription_1"
```
.\AzRgRemove.ps1 -Subscription "Test_Subsription-1" -Filter "Test*"
```
