variable directory {
    default = "/Users/bandala/Documents/bandala/code/terraform-labs"
}

variable filename {
    default = "tf-file"
}

variable filecontent {
    default = "Hello, World!"
}

variable filemode {
    default = "0644"
}

variable "fileowner" {
    default = "bandala"
}

variable "filegroup" {
    default = "staff"
}

variable "filetype" {
    default = "file"
}

variable "prefix" {
    default = "tf-lab"
}

variable "suffix" {
    default = "txt"
}

variable "separator" {
    default = "."
}