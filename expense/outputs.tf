#use output.instances_info
#output.instances_info ==  aws_instance.expense  // this way we can directly call the output or below like also we can do.

output "instances_info" {
    value = aws_instance.expense
}