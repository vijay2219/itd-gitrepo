variable "key_name" {
    type = string
}

variable "instance_type" {
    type = string
}
variable "instance_name" {
    type = string

}
variable "dynamodb_name"{
    type = string
    default = ""
}

variable "hash_key"{
    type = string
    default = ""
}
variable "bucket_name"{
    type = string
    default= ""
}

variable "sse_algorithm"{
    type = string
    default= ""
}

