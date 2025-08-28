variable "public_subnets" {}
variable "vpc_id" {}
variable "sg_id" {}               # ALB Security Group
variable "target_group_port" {
  default = 9200                 # Elasticsearch listens on port 9200
}
