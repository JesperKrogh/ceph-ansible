resource "aws_instance" "management-host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.cephadm.id
  key_name = aws_key_pair.terraformcluster.key_name
  associate_public_ip_address = true
  user_data = "#!/bin/bash\nsudo hostname mangement.ceph.internal\n"
  tags = {
        Name = "Ceph Management Host"
  }
}

resource "aws_instance" "mon1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  associate_public_ip_address = false
  tags = {
        Name = "Ceph Monitor 1"
  }
  user_data = "#!/bin/bash \nsudo hostname mon1.ceph.internal\n"
}


resource "aws_instance" "mon2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  associate_public_ip_address = false
  tags = {
        Name = "Ceph Monitor 2"
  }
  user_data = "#!/bin/bash \nsudo hostname mon2.ceph.internal\n"
}

resource "aws_instance" "mon3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  tags = {
        Name = "Ceph Monitor 3"
  }
  associate_public_ip_address = false
  user_data = "#!/bin/bash \nsudo  hostname mon3.ceph.internal\n"
}
