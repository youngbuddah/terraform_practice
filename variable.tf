variable "environments" {
  type = map(string)
  default = {
    dev   = "t2.micro"
    stage = "t2.small"
    prod  = "t2.medium"
  }
}
