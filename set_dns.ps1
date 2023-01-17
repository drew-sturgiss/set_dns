# Define Local network names
$home_networks = @('SturgimusMinimus', 'SturgimusMaximus')

# Define local DNS
$local_dns = '192.168.20.14'

# Define generic dns
$generic_dns_primary = '8.8.8.8, 8.8.4.4'

# Check connected network
$network_name = Get-NetConnectionProfile -InterfaceAlias 'Wi-Fi' | Select -ExpandProperty Name

# Get the index number of the Wi-Fi network
$interface_index = Get-NetConnectionProfile -InterfaceAlias 'Wi-Fi' | Select -ExpandProperty InterfaceIndex


# If connected to a local network, set local DNS
if ($home_networks -contains $network_name) {
	Set-DnsClientServerAddress -InterfaceIndex $interface_index -ServerAddresses $local_dns
}
else {
	Set-DnsClientServerAddress -InterfaceIndex $interface_index -ServerAddresses $generic_dns_primary
}
