terraform {
  required_providers {
    bufo = {
      source = "austinvalle/bufo"
    }
  }
}

resource "terraform_data" "test" {
  lifecycle {
    action_trigger {
      events  = [before_create, after_create]
      actions = [action.bufo_print.awesome, action.bufo_print.bigeyes]
    }
  }
}

action "bufo_print" "awesome" {
  config {
    name = "awesomebufo"
  }
}

action "bufo_print" "bigeyes" {
  config {
    name= "bufo-big-eyes-stare"
  }
}

