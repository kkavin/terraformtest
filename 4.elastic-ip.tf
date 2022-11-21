# Create Resource IP depends on


resource "aws_eip" "eip" {
    instance = aws_instance.test_ec2.id
    vpc = true
    depends_on = [ aws_internet_gateway.vpc_test_igw ]
  
}
