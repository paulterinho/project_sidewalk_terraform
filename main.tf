# Create the VM
resource "openstack_compute_instance_v2" "project_sidewalk" {
  name = "project_sidewalk"
  image_id = var.image_id
  flavor_id = var.flavor_id
  key_pair = var.key_pair
  security_groups = ["default"]

  network {
    name = var.network_name
  }
}

# Create a Floating Point IP address (FIP)
resource "openstack_networking_floatingip_v2" "project_sidewalk_fip" {
  pool = var.pool
}

# Associate the FIP with the Image Instance
resource "openstack_compute_floatingip_associate_v2" "project_sidewalk_fip" {
  floating_ip = openstack_networking_floatingip_v2.project_sidewalk_fip.address
  instance_id = openstack_compute_instance_v2.project_sidewalk.id
}