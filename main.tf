# Privider 
terraform {
  required_providers {
    tidbcloud = {
      source = "tidbcloud/tidbcloud"
    }
  }

  cloud {
    hostname     = "app.terraform.io"
    organization = "jetlabdotcloud"
    workspaces {
      name = "tidb-terraform-practice"
    }
  }
}

provider "tidbcloud" {
  public_key = var.tidb_public_key
  private_key = var.tidb_private_key
}

# TiDB Cluster
resource "tidbcloud_cluster" "jetlab" {
  project_id     = "1372813089203061287"
  name           = "jetlab-cluster"
  cluster_type   = "DEVELOPER"
  cloud_provider = "AWS"
  region         = "ap-southeast-1"
  config = {
    root_password = var.tidb_root_password
  }
}


# TODO: Connect Database and create new table