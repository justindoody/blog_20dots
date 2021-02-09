resource "digitalocean_droplet" "apps" {
  image = "ubuntu-20-04-x64"
  name = "apps"
  region = "nyc3"
  size = "s-1vcpu-2gb"
  monitoring = true
  private_networking = true
  ipv6 = true
  ssh_keys = [
    data.digitalocean_ssh_key.macbook.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
}

# DigitalOcean provides a compelling CDN service but starts at a minimum of
# $5 a month which is just overkill as right now I only need a few GB of
# storage for my apps. i.e. blog images

resource "digitalocean_volume" "apps-data" {
  region                  = "nyc3"
  name                    = "apps-data"
  size                    = 5
  initial_filesystem_type = "ext4"
  description             = "General purpose CDN replacement for various small apps. Also potentially logs."
}

resource "digitalocean_volume_attachment" "apps-data" {
  droplet_id = digitalocean_droplet.apps.id
  volume_id  = digitalocean_volume.apps-data.id
}

# Firewall allowing inbound from anywhere for SSH and web and outbound wide open.
resource "digitalocean_firewall" "apps" {
  name = "apps"

  droplet_ids = [digitalocean_droplet.apps.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}