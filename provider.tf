terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
  required_version = ">= 1.13.0"
}

provider "yandex" {
  service_account_key_file = "${path.module}/key.json"
  cloud_id  = "b1ggqfo0dsargh78crnv"
  folder_id = "b1g4710rp5mtgk1t1imk"
  zone      = "ru-central1-a"
}
