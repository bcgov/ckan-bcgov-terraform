resource "local_file" "repo"{

  lifecycle {
    ignore_changes = ["id"]
  }

  content = "created by terraform"
  filename = "${path.root}/${local.installPath}/.${local.gitFinalPath}.tf"

  provisioner "local-exec"{
    command = "${local.command}"
  }

  provisioner "local-exec" {
    command = "rm -rf ${path.root}/${local.installPath}/${local.gitFinalPath}"
    when = "destroy"
  }
}