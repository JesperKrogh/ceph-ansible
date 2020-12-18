resource "aws_instance" "management-host" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.cephadm.id
  key_name = aws_key_pair.terraformcluster.key_name
  associate_public_ip_address = true
  user_data = "#!/bin/bash\nsudo hostname management\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\necho 'management' > /tmp/hostname\nsudo mv /tmp/hostname /etc/hostname\n"
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
  user_data = "#!/bin/bash\nsudo hostname mon1\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
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
  user_data = "#!/bin/bash\nsudo hostname mon2\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
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
  user_data = "#!/bin/bash\nsudo hostname mon3\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
}


resource "aws_instance" "osd1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "i3.large"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  tags = {
        Name = "Ceph OSD 1"
  }
  associate_public_ip_address = false
  user_data = "#!/bin/bash\nsudo hostname osd1\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
}

resource "aws_instance" "osd2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "i3.large"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  tags = {
        Name = "Ceph OSD 2"
  }
  associate_public_ip_address = false
  user_data = "#!/bin/bash\nsudo hostname osd2\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
}

resource "aws_instance" "osd3" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "i3.large"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  tags = {
        Name = "Ceph OSD 3"
  }
  associate_public_ip_address = false
  user_data = "#!/bin/bash\nsudo hostname osd3\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
}

resource "aws_instance" "osd4" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "i3.large"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.ceph.id
  key_name = aws_key_pair.terraformcluster.key_name
  tags = {
        Name = "Ceph OSD 4"
  }
  associate_public_ip_address = false
  user_data = "#!/bin/bash\nsudo hostname osd4\nsed -i 's/compute.internal/compute.internal ceph.internal/' /etc/resolv.conf\ncp /etc/resolv.conf /tmp; rm /etc/resolv.conf; mv /tmp/resolv.conf /etc\n"
}

