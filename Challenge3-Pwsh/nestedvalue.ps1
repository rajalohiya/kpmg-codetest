function Get-NestedValue {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable]$Object,

        [Parameter(Mandatory=$true)]
        [string]$Key
    )

    $keys = $Key -split "/"
    $current = $Object

    foreach ($k in $keys) {
        if ($current.ContainsKey($k)) {
            $current = $current[$k]
        } else {
            throw "Key '$k' not found in the object"
        }
    }

    return $current
}

# Example usage
$object1 = @{
    "a" = @{
        "b" = @{
            "c" = "d"
        }
    }
}

$object2 = @{
    "x" = @{
        "y" = @{
            "z" = "a"
        }
    }
}

$key1 = "a/b/c"
$key2 = "x/y/z"

$value1 = Get-NestedValue -Object $object1 -Key $key1
$value2 = Get-NestedValue -Object $object2 -Key $key2

Write-Output "Value for ${key1}: $value1"
Write-Output "Value for ${key2}: $value2"
