prefix = "cngbb"
suffix = ""
location = "eastus"
kubernetes_version = "1.17.9"
default_np_sku_size = "Standard_DS2_v2"
default_np_count = 2
user_np_sku_size = "Standard_DS4_v2"
user_np_count = 3
network_plugin = "azure"
network_policy = "calico"
load_balancer_sku = "Standard"
service_cidr = "192.168.0.0/24"
dns_service_ip = "192.168.0.10"
docker_bridge_cidr = "172.17.0.1/24"