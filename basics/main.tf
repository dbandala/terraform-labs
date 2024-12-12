resource local_file pet {
    # sensitive_content = ""
    filename             = "${var.directory}/${var.filename}${var.separator}${var.suffix}"
    content              = var.filecontent
    file_permission      = var.filemode
    directory_permission = var.filemode
}


