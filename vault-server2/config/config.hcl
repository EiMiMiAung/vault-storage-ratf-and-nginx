disable_mlock = true

storage "raft" {
  path = "/vault/file"
  node_id = "node2"

  retry_join {
    leader_api_addr = "http://vault-dev-server1:8200"
  }

  retry_join {
    leader_api_addr = "http://vault-dev-server3:8200"
  }
}
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = true
}

# https://developer.hashicorp.com/vault/docs/configuration#high-availability-parameters
api_addr = "http://vault-server2:8200"
cluster_addr = "http://vault-server2:8201" #Vault will ignore whatever URL scheme you write in the config and override it with https://. The certificates used with this endpoint are fully managed internally to Vault
cluster_name = "sg-vault-cluster"

ui = true
log_level = "debug"