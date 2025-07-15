# You might not need to specify the null provider explicitly, 
# but it can be helpful for clarity and debugging.
provider "null" {
  # no configuration required
}

# Define a variable for the number of null resources to create.
# Adjust this number to control how large your stress test is.
variable "resource_count" {
  type    = number
  default = 11
}

# Create 'resource_count' instances of a null_resource.
resource "null_resource" "stress_test" {
  count = var.resource_count

  # Optionally, you can add triggers to force recreation or store extra info.
  triggers = {
    index = "${count.index}"
  }

  # Optionally, you can add a provisioner to see some output during apply,
  # but that will also add overhead to the run.
  provisioner "local-exec" {
    command = "echo Creating resource index: ${count.index}"
  }
}

