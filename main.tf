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

data "tidbcloud_projects" "jetlabdotcloud" {
  page      = 1
  page_size = 10
}

output "output" {
  value = 
}
provider "tidbcloud" {
  public_key = var.tidb_public_key
  private_key = var.tidb_private_key
}

resource "tidbcloud_cluster" "jetlab" {
  project_id     = data.tidbcloud_projects.jetlabdotcloud
  name           = "jetlab-cluster"
  cluster_type   = "DEVELOPER"
  cloud_provider = "AWS"
  region         = "ap-southeast-1"
  config = {
    root_password = var.tidb_root_password
    port = 4000

  }
}