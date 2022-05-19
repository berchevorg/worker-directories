resource "null_resource" "pwd" {
  provisioner "local-exec" {
    command = "pwd"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "files" {
  depends_on = [ null_resource.pwd ]
  provisioner "local-exec" {
    command = "find | sed 's|[^/]*/|- |g'"
  }
  triggers = {
    run_every_time = uuid()
  }
}


