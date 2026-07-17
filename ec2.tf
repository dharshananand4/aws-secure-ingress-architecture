resource "aws_instance" "app" {
  count                  = 2
  ami                    = "ami-053b0d53c279acc90" # Ubuntu Server 24.04 LTS
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private[count.index].id
  vpc_security_group_ids = [aws_security_group.app.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              echo "<h1>Secure App Instance ${count.index} Online</h1>" > /var/www/html/index.html
              EOF

  tags = { Name = "app-server-${count.index}" }
}

resource "aws_lb_target_group_attachment" "app" {
  count            = 2
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = aws_instance.app[count.index].id
  port             = 80
}
