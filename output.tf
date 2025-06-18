output "instance_names" {
  value = [for env in keys(var.environments) : "ec2-${env}"]
}
