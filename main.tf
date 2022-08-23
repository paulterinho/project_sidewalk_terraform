resource "openstack_compute_instance_v2" "project_sidewalk" {
  name = "project_sidewalk"
  image_id = "79ccd58e-931a-406a-af16-7d62529b0bd2" # Debian 10
  flavor_id = "14c9819b-1f73-48b6-a136-ffe8a6ade2ee" # 120 gig RAM, 0.5 Terrabyte drive
  key_pair = "Compute Canada"
  security_groups = ["default"]

  network {
    name = "def-vfast-dev-network"
  }
}

# Create a Floating Point IP address (FIP)
resource "openstack_networking_floatingip_v2" "project_sidewalk_fip" {
  pool = "Public-Network"
}

# Associate the FIP with the Image Instance
resource "openstack_compute_floatingip_associate_v2" "project_sidewalk_fip" {
  floating_ip = openstack_networking_floatingip_v2.project_sidewalk_fip.address
  instance_id = openstack_compute_instance_v2.project_sidewalk.id
}