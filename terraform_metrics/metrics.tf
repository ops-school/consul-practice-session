resource "aws_instance" "metrics_servers" {
  count = "${var.metrics_servers}"

  ami           = "${lookup(var.metrics-ami, var.region)}"
  instance_type = "t2.small"
  key_name      = "${var.key_name}"

  iam_instance_profile   = "${aws_iam_instance_profile.consul-join.name}"
  vpc_security_group_ids = ["${aws_security_group.opsschool_consul.id}","${aws_security_group.metrics-server-sec.id}"]

  tags = {
    Name = "opsschool-client-${count.index+1}"
  }

  user_data = "${element(data.template_file.consul_client.*.rendered, count.index)}"
}

# Create the user-data for the Consul agent
data "template_file" "consul_client" {
  count    = "${var.metrics_servers}"
  template = "${file("${path.module}/templates/consul.sh.tpl")}"

  vars {
    consul_version = "${var.consul_version}"
    config = <<EOF
     "node_name": "opsschool-client-${count.index+1}",
     "enable_script_checks": true,
     "server": false
    EOF
  }
}

resource "aws_security_group" "metrics-server-sec" {
  name        = "metrics-server-sec"
  description = "Allow ssh & consul inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow all inside security group"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ssh from the world"
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow grafana UI access from the world"
  }

  ingress {
    from_port   = 8080
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow dummyExporter metrics from dockes from the world"
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow node exporter metrics to the world"
  }

  ingress {
    from_port   = 9090
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow prometheus UI access from the world"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "Allow all outside security group"
  }
}

output "clients" {
  value = ["${aws_instance.metrics_servers.*.public_ip}"]
}
