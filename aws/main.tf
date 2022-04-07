variable "subnet_id" {
    default = "subnet-02f612516fca54940"                    # Preferred Subnet
}

variable "private_ip" {
    default = "172.31.88.88"                                # Preferred IP
}

variable "ami" {
    default = "ami-04505e74c0741db8d"                     
}

variable "instance_type" {
    default = "t2.micro"                    
}

variable "key_name" {
    default = "wato-infra-challenger"                       
}

variable "security_group" {
    default = "wato-infra-challenge"                   
}

variable "studentID" {
    default = "f39gao"                   
}

data "aws_subnet" "subnet" {
  id = var.subnet_id
}

resource "aws_instance" "vm" {
  # us-east-1
  ami           = var.ami
  instance_type = var.instance_type

  private_ip = var.private_ip                             
  subnet_id  = data.aws_subnet.subnet.id
  key_name = var.key_name
  security_groups = [var.security_group]
  tags = { "Name": var.studentID }

# Automation but not tested
#   user_data = <<EOF
# sudo apt-get update
# sudo apt-get install ca-certificates curl gnupg lsb-release
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get install docker-ce docker-ce-cli containerd.io
# sudo docker run -d -p 3000:3000 franklingao123/hello-world
# EOF

}


resource "aws_eip" "eip" {
  vpc = true

  instance                  = aws_instance.vm.id
  #associate_with_private_ip = "172.31.88.88"
  associate_with_private_ip = aws_instance.vm.private_ip
  #depends_on                = [aws_internet_gateway.gw]
}