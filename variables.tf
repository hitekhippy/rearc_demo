variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
    default = "demo-cluster"
    type = string
}

variable "cluster_version" {
    default = "1.20"
    type = string
    }