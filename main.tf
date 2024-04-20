terraform {
  required_providers {
    tidbcloud = {
      source = "tidbcloud/tidbcloud"
    }
  }

  cloud {
    organization = "jetlabdotcloud"
    workspaces {
      name = "tidb-terraform-practice"
    }
  }
}


provider "tidbcloud" {
  public_key = vars.tidb_public_key
  private_key = vars.tidb_private_key
}

resource "tidbcloud_cluster" "jetlab" {
  project_id     = "001"
  name           = "jetlab-cluster"
  cluster_type   = "DEVELOPER"
  cloud_provider = "AWS"
  region         = "ap-southeast-1"
  config = {
    root_password = vars.tidb_root_password
    port = 4000

  }
}