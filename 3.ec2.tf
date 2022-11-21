# Create EC2 instance

resource "aws_instance" "test_ec2" {
    ami = "ami-089950bc622d39ed8"
    instance_type = "t2.medium"
    key_name = "jenkinspoc"
    subnet_id = aws_subnet.public_subnet1.id
    vpc_security_group_ids = [ aws_security_group.vpc_test_sg.id ]
    root_block_device {
    volume_type = "gp3"
    volume_size = "50"
    delete_on_termination = true
}
#    user_data = file("docker.sh")
    user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
      sudo yum install -y yum-utils
      sudo yum install -y screen
      sudo yum install -y git
      sudo yum -y install docker
      sudo systemctl start docker
      sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose && sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose
      mkdir /opt/test && cd /opt/test
      chmod -R 755 /opt/test/ 
      git clone https://github.com/CareerFoundry-Engineering/practicum-devops.git  
      #screen -dmS test
      #screen -S test -p 0 -X stuff "cd /opt/test/practicum-devops/api && make build && make up && make prepare"
      cd /opt/test/practicum-devops/api && make build && make up && make prepare 
     
    EOF
}
