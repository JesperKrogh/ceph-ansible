resource "aws_route53_zone" "private" {
  name = "ceph.internal"

  vpc {
    vpc_id = aws_vpc.terraform.id
  }
}

resource "aws_route53_record" "management" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "management.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mon1.private_ip]
}


resource "aws_route53_record" "mon1" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "mon1.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mon1.private_ip]
}

resource "aws_route53_record" "mon2" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "mon2.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mon1.private_ip]
}

resource "aws_route53_record" "mon3" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "mon3.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mon1.private_ip]
}

