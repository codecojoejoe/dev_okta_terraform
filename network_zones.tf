resource "okta_network_zone" "blocked_countries" {
  name     = "Blocked - Countries"
  type     = "DYNAMIC"
  usage    = "BLOCKLIST"
  gateways = []
  proxies  = []
  dynamic_locations = [
    "AF", #Afghanistan
    "AO", #Angola
    "BI", #Burundi
    "KH", #Cambodia
    "TD", #Chad
    "CD", #Congo, Democratic Republic of the
    "CG", #Congo
    "GQ", #Equatorial Guinea
    "GW", #Guinea-Bissau
    "HT", #Haiti
    "IR", #Iran, Islamic Republic of
    "IQ", #Iraq
    "KP", #Korea, Democratic People's Republic of
    "LY", #Libya (previously Libyan Arab Jamahiriya)
    "RU", #Russian Federation
    "SO", #Somalia
    "SS", #South Sudan
    "SD", #Sudan
    "SY", #Syrian Arab Republic (previously Syria)
    "TM", #Turkmenistan
    "UA", #Ukraine
    "VE", #Venezuela, Bolivarian Republic of (previously Venezuela)
    "YE", #Yemen
  ]
}

resource "okta_network_zone" "blocked_tor" {
  name               = "Blocked - Tor"
  type               = "DYNAMIC"
  usage              = "BLOCKLIST"
  dynamic_proxy_type = "TorAnonymizer"
  gateways           = []
  proxies            = []
  dynamic_locations  = []
}

resource "okta_network_zone" "clearpass" {
  name  = "ClearPass"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "52.9.107.127/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "office_gfp" {
  name  = "Office GFP"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "71.181.0.174/32",
    "208.125.129.226/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "office_msp" {
  name  = "Office MSP"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "96.87.153.49/32",
    "38.142.172.194-38.142.172.200",
    "50.217.155.33-50.217.155.33",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "office_pwm" {
  name  = "Office PWM"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "64.222.199.6/32",
    "66.231.199.210 - 66.231.199.222",
    "71.161.105.90/32",
    "71.255.144.49/32",
    "104.254.68.54/32",
    "208.125.158.139/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "office_rno" {
  name  = "Office RNO"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "12.197.154.194/32",
    "64.124.45.194/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "office_sfo" {
  name  = "Office SFO"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "4.4.36.1/32",
    "38.99.6.179/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "panorama" {
  name  = "Panorama"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "52.52.38.227/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "prisma" {
  name  = "Prisma"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "13.52.159.3/32",
    "13.52.159.24/32",
    "13.52.159.239/32",
    "13.52.159.243/32",
    "15.185.120.116/32",
    "15.185.120.122/32",
    "34.98.153.150/31",
    "34.98.157.150/31",
    "34.98.161.150/31",
    "34.98.165.150/31",
    "34.98.169.150/31",
    "34.98.177.150/31",
    "34.98.181.150/31",
    "34.98.185.150/31",
    "34.98.189.150/31",
    "34.98.193.150/31",
    "34.98.197.150/31",
    "34.98.201.150/31",
    "34.98.205.150/31",
    "34.98.209.150/31",
    "34.98.213.150/31",
    "34.98.225.150/31",
    "34.98.227.150/31",
    "34.98.229.150/31",
    "34.98.231.150/31",
    "34.98.233.150/31",
    "34.98.235.150/31",
    "34.98.237.150/31",
    "34.98.239.150/31",
    "34.99.1.150/31",
    "34.99.5.150/31",
    "34.99.10.143/32",
    "34.99.10.144/32",
    "34.99.13.150/31",
    "34.99.17.150/31",
    "34.99.33.150/31",
    "34.99.37.150/31",
    "34.99.41.150/31",
    "34.99.45.150/31",
    "34.99.49.150/31",
    "34.99.53.150/31",
    "34.99.57.150/31",
    "34.99.65.150/31",
    "34.99.67.150/31",
    "34.99.69.150/31",
    "34.99.71.150/31",
    "34.99.81.150/31",
    "34.99.85.150/31",
    "34.99.89.150/31",
    "34.99.90.106/32",
    "34.99.93.150/31",
    "34.99.97.150/31",
    "34.99.101.150/31",
    "34.99.105.150/31",
    "34.99.109.150/31",
    "34.99.113.150/31",
    "34.99.129.150/31",
    "34.99.131.150/31",
    "34.99.133.150/31",
    "34.99.135.150/31",
    "34.99.137.150/31",
    "34.99.139.150/31",
    "34.99.141.150/31",
    "34.99.143.150/31",
    "34.99.145.150/31",
    "34.99.147.150/31",
    "34.99.151.150/31",
    "34.99.153.150/31",
    "34.99.155.150/31",
    "34.99.157.150/31",
    "34.99.159.150/31",
    "34.99.161.150/31",
    "34.99.163.150/31",
    "34.99.165.150/31",
    "34.99.167.150/31",
    "34.99.169.150/31",
    "34.99.171.150/31",
    "34.99.173.150/31",
    "34.99.175.150/31",
    "34.99.177.150/31",
    "34.99.179.150/31",
    "34.99.181.150/31",
    "34.99.183.150/31",
    "34.99.185.214/31",
    "34.99.187.214/31",
    "34.99.189.214/31",
    "34.99.191.214/31",
    "34.99.193.214/31",
    "34.99.195.214/31",
    "34.99.197.214/31",
    "34.99.199.214/31",
    "34.100.1.150/31",
    "34.100.5.150/31",
    "34.100.10.143/32",
    "34.100.10.144/32",
    "34.100.13.150/31",
    "34.100.17.150/31",
    "34.100.21.150/31",
    "34.100.25.150/31",
    "34.100.29.150/31",
    "34.100.33.150/31",
    "34.100.37.150/31",
    "34.100.41.150/31",
    "34.100.65.150/31",
    "34.100.69.150/31",
    "34.100.73.150/31",
    "34.100.77.150/31",
    "34.100.81.150/31",
    "34.100.89.150/31",
    "34.100.94.136/32",
    "34.124.64.56/31",
    "34.124.85.145/32",
    "34.124.85.146/32",
    "34.124.89.153/32",
    "52.52.156.57/32",
    "134.238.161.9/32",
    "134.238.161.89/32",
    "134.238.162.160/32",
    "134.238.165.172/31",
    "134.238.169.107/32",
    "134.238.169.108/32",
    "134.238.179.208/31",
    "134.238.182.111/32",
    "134.238.184.213/32",
    "134.238.184.214/32",
    "134.238.186.246/32",
    "134.238.195.214/31",
    "134.238.197.73/32",
    "134.238.200.167/32",
    "134.238.200.168/32",
    "137.83.202.22/32",
    "137.83.202.220/32",
    "137.83.204.220/31",
    "137.83.206.200/30",
    "208.127.82.144/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "threatinsight_exemption" {
  name  = "ThreatInsight Exemption"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "52.9.107.127/32",
    "74.69.245.65-74.69.245.65",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "third_party_asmgi" {
  name  = "Third Party - ASMGi"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "66.132.0.0/24",
    "66.132.2.0/24",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "third_party_jamf" {
  name  = "Third Party - Jamf"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "34.233.253.88/32",
    "34.234.26.211/32",
    "52.1.62.94/32",
    "52.1.215.211/32",
    "52.39.2.203/32",
    "52.39.4.253/32",
    "52.72.152.43/32",
    "52.203.216.218/32",
    "54.208.14.206/32",
    "54.208.84.215/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "third_party_nice" {
  name  = "Third Party - NICE"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "34.236.93.148/32",
    "34.236.101.36/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "workspaces_oregon" {
  name  = "WorkSpaces Oregon"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "34.223.119.184/32",
    "44.234.205.228/32",
  ]
  proxies           = []
  dynamic_locations = []
}

resource "okta_network_zone" "workspaces_virginia" {
  name  = "WorkSpaces Virginia"
  type  = "IP"
  usage = "POLICY"
  gateways = [
    "54.147.235.6/32",
    "54.174.240.69/32",
  ]
  proxies           = []
  dynamic_locations = []
}
