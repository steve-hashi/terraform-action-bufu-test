terraform {
  required_providers {
    external = {
      source = "registry.terraform.io/hashicorp/external"
    }
  }
}

resource "terraform_data" "fake_resource" {
  input = "fake-string"

  lifecycle {
    action_trigger {
     events  = [before_create]
     actions = [action.external.test_before]
    }
    action_trigger {
      events  = [after_create]
      actions = [action.external.test_after]
    }
  }
}

action "external" "test_before" {
  config {
    program = ["echo", "Before!"]
  }
}

action "external" "test_after" {
  config {
    program = ["echo", "After!"]
  }
}
