resource "aws_route53_zone" "private" {
  name = "ceph.internal"

  vpc {
    vpc_id = aws_vpc.ceph.id
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
  records = [aws_instance.mon2.private_ip]
}

resource "aws_route53_record" "mon3" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "mon3.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.mon3.private_ip]
}



resource "aws_route53_record" "osd1" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "osd1.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.osd1.private_ip]
}

resource "aws_route53_record" "osd2" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "osd2.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.osd2.private_ip]
}
resource "aws_route53_record" "osd3" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "osd3.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.osd3.private_ip]
}

resource "aws_route53_record" "osd4" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "osd4.ceph.internal"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.osd4.private_ip]
}

