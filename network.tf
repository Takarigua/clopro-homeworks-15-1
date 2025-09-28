# Создаём VPC
resource "yandex_vpc_network" "default" {
  name = "hw-network"
}

# NAT route table
resource "yandex_vpc_route_table" "private_routes" {
  network_id = yandex_vpc_network.default.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "192.168.10.254"  # IP NAT-инстанса
  }
}

# Публичная подсеть
resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Приватная подсеть
resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  route_table_id = yandex_vpc_route_table.private_routes.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}
